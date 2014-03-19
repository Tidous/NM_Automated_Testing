#encoding:utf-8
$DEBUG = 1
require 'selenium-webdriver'
require 'rubygems'
require './NM_login'
require './NM_locate_budget_template'
require './NM_alert'

locate=Locate::Locate.new
locate.locate_budget_template()
locate.locate_columnset()
locate.columnset_add('201403061','201403061',2)
alert=Alert::Alert.new
alert.accept()