#encoding:gbk
$DEBUG = 1  #ruby
require 'selenium-webdriver'
require 'rubygems'
require './NM_login'

module Alert
	class Alert
		def accept()
			$driver.switch_to.alert().accept()
		end
	end
end