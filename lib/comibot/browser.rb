module Comibot
  class Browser

    attr_accessor :url

    def initialize(url, meeting, email, password)
      @url      = url
      @meeting  = meeting
      @email    = email
      @password = password
      @session  = Selenium::WebDriver.for :chrome
      @session.navigate.to @url
    end

    def login
      @session.find_element(:id, 'user_email').send_keys @email
      @session.find_element(:id, 'user_password').send_keys @password
      @session.find_element(:id, 'user_submit').click
    end

    def new_message(message)
      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      wait.until {
        @session.find_element(:xpath, "//a[@title='#{@meeting}']").click
      }
      wait.until {
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
