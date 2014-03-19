#encoding:utf-8
$DEBUG =1
require 'selenium-webdriver'
require 'rubygems'
require './NM_login'
require './NM_locate_budget_template'
require './NM_alert'

ie=Login::Login.new
ie.login("admin","1234")
sleep 1
temp=Template::Template.new
temp.locate_budget_template()
temp.template_add("xq20140310","xq20140310",3,2)
temp.layout_stable_add("xq20140310","xq20140310","20140307","20140307")

ie.refresh
ie.logout