$DEBUG = 1  #ruby
require 'selenium-webdriver'

module Login
  class Login
    $driver=Selenium::WebDriver.for :ie
    def initialize()
      $driver.navigate.to "http://10.87.66.148:8080/pccw.epsapp/entry/login.jsp"
      @account=$driver.find_element(:id,'account')
      @pwd=$driver.find_element(:id,'password')
    end

    def login(username,password)
      @account.clear
      @account.send_keys(username)
      sleep 1
      @pwd.send_keys(password)
      $driver.find_element(:id,'save').click
    end

    def refresh()
      sleep 1
      $driver.switch_to.default_content()
      $driver.switch_to.frame("i_top")
      $driver.find_element(:xpath,'/html/body/div/div[2]/div/div/div/div/ul/li[2]/a').click
      sleep 1
    end

    def logout()
      $driver.switch_to.default_content()
      $driver.switch_to.frame("i_top")
      $driver.find_element(:xpath,'/html/body/div/div[2]/div/div/div/div/ul/li[2]/a[2]').click
      sleep 1
    end
    
    def quit()
      $driver.quit()
    end
  end
end

#F5

