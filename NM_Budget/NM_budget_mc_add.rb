#encoding:utf-8
$DEBUG =1
require 'selenium-webdriver'
require 'rubygems'
require './NM_login'
require './NM_budget_making'
require 'test/unit'

ie=Login::Login.new
ie.login("admin","1234")
sleep 1

budget=Budget::Budget.new
budget.locate_budget_making("mc")
i=1
while i<13 do
  budget.period_company_budget_add("xq20140523","本部",2,1,i,1,1)
  i=i+1
end
ie.quit()