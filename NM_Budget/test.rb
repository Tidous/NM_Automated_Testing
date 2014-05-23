#encoding:utf-8
$DEBUG = 1
require 'selenium-webdriver'
require 'rubygems'
require './NM_login'
require './NM_locate_budget_template'
require './NM_alert'
require 'test/unit'

class Test_method<Test::Unit::TestCase
  def test_operate
    login=Login::Login.new
    login.login("admin","1234")
    temp=Template::Template.new
    temp.locate_budget_template
    temp.locate_columnset
    temp.columnset_add("cid_tidous","cname_tidous")
    alert_text=$driver.switch_to().alert().text()
    assert_equal("保存成功！",alert_text)
    $driver.switch_to().alert().accept()
  end
end