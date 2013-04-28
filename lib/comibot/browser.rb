module Comibot
  class Browser

    def initialize(url, timeout)
      @url      = url
      @session  = Selenium::WebDriver.for :chrome
      @session.navigate.to @url
      @wait = Selenium::WebDriver::Wait.new(:timeout => timeout)
    end

    def login(email, password)
      @session.find_element(:id, 'user_email').send_keys email
      @session.find_element(:id, 'user_password').send_keys password
      @session.find_element(:id, 'user_submit').click
    end

    def select_group(group_id)
      @wait.until {
        @session.find_element(:id, 'my-groups-button').click
      }
      @session.find_element(:xpath, "//div[@id='my-groups-container']/ul[@id='my-groups']/li/a[@href='#{group_id}']").click
    end

    def select_meeting(meeting_name)
      @wait.until {
        @session.find_element(:xpath, "//a[@title='#{meeting_name}']").click
      }
    end

    def new_message(message)
      @wait.until {
        @session.find_element(:xpath, '//div[@class="SWCEY replyBox" and @kind="rb"]').click
      }

      reply_text = @session.find_element(:xpath, '//div[@class="document wave-editor-on"]')
      reply_text.send_keys message
      reply_text.send_keys :shift, :return
    end  

    def close
      @session.quit
    end
  end
end
