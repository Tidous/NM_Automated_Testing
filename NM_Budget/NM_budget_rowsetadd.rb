#encoding : gbk
$DEBUG = 1 
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
temp.locate_rowset()
temp.rowset_add("HJ34","HJ34","��Ŀ�������")
#����м�

locate.rowadd("���÷���",15,2)
#locate.rowadd("�������",15,2)
#locate.rowadd("�д�����",15,2)
#locate.rowadd("��������",15,2)

