#encoding : gbk
$DEBUG =1
require 'selenium-webdriver'
require 'rubygems'
require './NM_login'
require './NM_budget_making'

ie=Login::Login.new
ie.login("admin","1234")
sleep 1

budget=Budget::Budget.new
budget.locate_budget_making("yd")
budget.annual_department_budget_add("xq20140307","����","���Ż��ذ칫������",3,1)