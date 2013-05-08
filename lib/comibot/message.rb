module Comibot
  class Message
    def self.run(email, password, group_id, meeting_name, message)
      @browser = Browser.new(10)
      @browser.login(email, password)
      @browser.select_group(group_id)
      @browser.select_meeting(meeting_name)
      @browser.new_message(message)
      sleep(3)
      @browser.close
    end
  end
end
