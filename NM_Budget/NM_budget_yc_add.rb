#encoding:utf-8
$DEBUG =1
require 'selenium-webdriver'
require 'rubygems'
require './NM_login'
require './NM_budget_making'

ie=Login::Login.new
ie.login("admin","1234")
sleep 1

budget=Budget::Budget.new
budget.locate_budget_making("yc")
budget.annual_company_budget_add("xq20140307","物资",3,1,1)
