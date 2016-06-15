require "spec_helper"

describe Lita::Handlers::Away, lita_handler: true do
  context "when a user has no afk status" do
  	before :each do
      @afk_msg = "I'm away"
      send_command("afk #{@afk_msg}")
    end
    it "informing user of their new status" do
      expect(replies.last).to include(@afk_msg)
    end
  end

  context "when a user has an afk status" do
    before :each do
      @old_msg = "I'm away"
      @new_msg = "I'm out sick."
    end

  	it "should inform user that their status has changed from the previous status" do
      send_command("afk #{@old_msg}") 
      send_command("afk #{@new_msg}") 
      expect(replies.last).to include(@old_msg, @new_msg)
  	end

    it "should inform other users of afk status when mentioned with @" do
      user_with_status = Lita::User.create(123, name: "WithStatus User", mention_name: "withstatus")
      rando_user = Lita::User.create(124, name: "Random User", mention_name: "rando")
      send_command("afk #{@old_msg}", as: user_with_status) 
      
      send_message("@#{user_with_status.metadata['mention_name']} Hi!", as: rando_user)
      expect(replies.last).to eq("#{user_with_status.name} is afk. Away Message: '#{@old_msg}'.")
    end

    xit "should inform other users of afk status when mentioned without @" do
      user_with_status = Lita::User.create(123, name: "WithStatus User", mention_name: "withstatus")
      rando_user = Lita::User.create(124, name: "Random User", mention_name: "rando")
      send_command("afk #{@old_msg}", as: user_with_status) 
      
      send_message("#{user_with_status.metadata['mention_name']} Hi!", as: rando_user)
      expect(replies.last).to eq("#{user_with_status.name} is afk. Away Message: '#{@old_msg}'.")
    end

  end
end
