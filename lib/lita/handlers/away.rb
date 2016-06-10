module Lita
  module Handlers
    class Away < Handler
      route(/^afk\s+(.+)/, :afk, command: true, help: { "afk STATUS MESSAGE" => "Sets your away from keyboard status." })
      route(/^afk-undo/, :afk_undo, command: true, help: { "afk-undo" => "Deletes your existing afk status message." })
      route(/@(\S+)/, :inform_status, command: false, help: {"@USER_NAME" => "If you mention a user who has an afk status, Finley will inform you via DM."})
      
      def afk(response)
        new_status = response.matches.flatten.pop
        previous_status = redis.get(response.user.id)
      	
      	if redis.set(response.user.id, new_status)
      	  if previous_status
            response.reply_privately("Your away message is now: '#{new_status}'. Changed from '#{previous_status}'.")
          else
          	response.reply_privately("Your away message is now: '#{new_status}'")
          end
        else
          response.reply_privately("I couldn't update your status. Try it again?")
        end
      end

      def afk_undo(response)
        if redis.del(response.user.id) > 0
          response.reply_privately("Your away message has been deleted.")
        else
          response.reply_privately("I couldn't find an away message for you.")
        end
      end

      def inform_status(response)
        name = response.matches.flatten.pop
        user = Lita::User.fuzzy_find(name) || Lita::User.fuzzy_find(name.chop)
        if user && redis.get(response.user.id)
          message = redis.get(response.user.id) 
          response.reply_privately("#{user.name} is afk. Away Message: '#{message}'.")
        else
          true
        end
      end

      Lita.register_handler(self)
    end
  end
end
