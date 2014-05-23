#encoding:utf-8
$DEBUG =1
require 'selenium-webdriver'
require 'rubygems'
require './NM_login'
require './NM_locate_budget_template'
require './NM_alert'
require 'test/unit'

ie=Login::Login.new
ie.login("admin","1234")
sleep 1
temp=Template::Template.new
temp.locate_budget_template()
temp.template_add("xq20140523","xq20140523",3,2)
temp.layout_stable_add("xq20140523","xq20140523","20140307","20140307")
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tfoot/tr/td/center/button[3]').click
sleep 1
class Test_layout_add<Test::Unit::TestCase
  def test_operate
    alert_text=$driver.switch_to.alert().text()
    assert_equal("校验成功！",alert_text,"模版创建成功")
    $driver.switch_to.alert().accept()
    $driver.quit()
  end
end