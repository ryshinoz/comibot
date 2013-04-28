module Comibot
  class Message
    def self.run(url, meeting, email, password, message)
      @browser = Browser.new(url, meeting, email, password)
      @browser.login
      @browser.new_message(message)
      sleep(3)
      @browser.close
    end
  end
end
