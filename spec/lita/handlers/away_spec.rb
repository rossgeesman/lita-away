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
      send_command("afk #{@old_msg}")
      @new_msg = "I'm out sick."
      send_command("afk #{@new_msg}")	
  	end

  	it "should inform user that their status has changed from the previous status" do
      expect(replies.last).to include(@old_msg, @new_msg)


  	end
  end

end
