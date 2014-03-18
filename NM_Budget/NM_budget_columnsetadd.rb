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
temp.locate_columnset()
temp.columnset_add('LJ31','LJ31',3)
alert=Alert::Alert.new
alert.accept()
sleep 1
#确定保存成功
array=["一月","二月","三月"]
length=array.length
puts length
i=0
while i <length do
j=i+7
$driver.switch_to.frame("addListIframe")
$driver.find_element(:xpath,'//*[@id="addButton"]').click
$driver.switch_to.default_content()
$driver.switch_to.frame("arch_popup_iframe0")
$driver.switch_to.frame("tab_inner_iframe")
$driver.find_element(:xpath,'//*[@id="columnLabel"]').send_keys(array[i])#列标题
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[4]/div/select/option').click#是否多列标题
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[6]/div/select/option[2]').click#是否必填项
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option[2]').click#是否显示
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[4]/select/option[2]').click#是否允许手工填写
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr/td[2]/select/option[5]').click#情景
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr/td[4]/select/option['+j.to_s+']').click#值类型
#$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr[2]/td[2]/select/option[2]').click#纬度类型
#$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr[2]/td[4]/select/option[4]').click#纬度集
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[3]/table/tbody/tr/td[2]/select/option').click#是否启用计算
$driver.find_element(:xpath,'//*[@id="calculationFormulaText"]').send_keys("")#输入计算公式
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[3]/table/tbody/tr[2]/td[2]/span/input[2]').click#不启用行上的计算公式
$driver.find_element(:xpath,'//*[@id="saveButton"]').click#保存
#保存子列，通过拼接xpath来满足情景值的循环
alert.accept()
sleep 2
#$driver.find_element(:xpath,'//*[@id="tab_2_li"]').click
#$driver.find_element(:xpath,'//*[@id="addNewColumnMapping"]').click
#$driver.find_element(:xpath,'//*[@id="selfConsolidationFlag"]').click
#$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[3]/td[4]/select/option[4]').click
#$driver.find_element(:xpath,'//*[@id="saveButton"]').click
#$driver.switch_to.alert().accept()
#$driver.find_element(:xpath,'//*[@id="closeButton"]').click
$driver.find_element(:xpath,'//*[@id="closeButton"]').click#取消返回添加列页面
sleep 1
$driver.switch_to.default_content()
$driver.switch_to.frame("i_right")
$driver.switch_to.frame("tab_inner_iframe")
i=i+1
end
$driver.switch_to.frame("addListIframe")
$driver.find_element(:xpath,'//*[@id="addButton"]').click
$driver.switch_to.default_content()
$driver.switch_to.frame("arch_popup_iframe0")
$driver.switch_to.frame("tab_inner_iframe")
$driver.find_element(:xpath,'//*[@id="columnLabel"]').send_keys("上报金额")
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[4]/div/select/option').click#是否多列标题
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[6]/div/select/option[2]').click#是否必填项
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option[2]').click#是否显示
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[4]/select/option[2]').click#是否允许手工填写
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr/td[2]/select/option[5]').click#情景
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr/td[4]/select/option[2]').click#值类型
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[3]/table/tbody/tr/td[2]/select/option[2]').click#是否启用计算
$driver.find_element(:xpath,'//*[@id="calculationFormulaText"]').send_keys('C["一月"]+C["二月"]+C["三月"]')#输入计算公式
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[3]/table/tbody/tr[2]/td[2]/span/input[2]').click#不启用行上的计算公式
$driver.find_element(:xpath,'//*[@id="saveButton"]').click#保存
#定义上报金额的列
alert.accept()
sleep 1
$driver.find_element(:xpath,'//*[@id="closeButton"]').click#取消返回添加列页面
sleep 1
$driver.switch_to.default_content()
$driver.switch_to.frame("i_right")
$driver.switch_to.frame("tab_inner_iframe")
$driver.switch_to.frame("addListIframe")
$driver.find_element(:xpath,'//*[@id="addButton"]').click
$driver.switch_to.default_content()
$driver.switch_to.frame("arch_popup_iframe0")
$driver.switch_to.frame("tab_inner_iframe")
$driver.find_element(:xpath,'//*[@id="columnLabel"]').send_keys("备注")
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[4]/div/select/option').click#是否多列标题
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[6]/div/select/option[2]').click#是否必填项
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option[2]').click#是否显示
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[4]/select/option[2]').click#是否允许手工填写
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr/td[2]/select/option[2]').click#列类型
#$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr/td[4]/select/option[2]').click#值类型
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr/td[6]/select/option[4]').click#数据类型
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[3]/table/tbody/tr/td[2]/select/option').click#是否启用计算
$driver.find_element(:xpath,'//*[@id="calculationFormulaText"]').send_keys("")#输入计算公式
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[3]/table/tbody/tr[2]/td[2]/span/input[2]').click#不启用行上的计算公式
$driver.find_element(:xpath,'//*[@id="saveButton"]').click#保存
alert.accept()
sleep 1
$driver.find_element(:xpath,'//*[@id="closeButton"]').click
sleep 1
column=1
while column<5 do
$driver.switch_to.default_content()
$driver.switch_to.frame("i_right")
$driver.switch_to.frame("tab_inner_iframe")
$driver.switch_to.frame("addListIframe")
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tfoot/tr[3]/td['+column.to_s+']/a').click
$driver.switch_to.default_content()
$driver.switch_to.frame("arch_popup_iframe0")
$driver.find_element(:xpath,'/html/body/div/div/div[2]/div[2]/div/ul/li[3]').click#汇总映射列
$driver.switch_to.frame("tab_inner_iframe")
$driver.find_element(:xpath,'/html/body/form/center/button').click#新增映射列
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option[2]').click#是否自汇总
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[3]/td[4]/select/option[4]').click#汇总条件
$driver.find_element(:xpath,'/html/body/form/div/div/center/button').click
alert.accept()
sleep 1
$driver.find_element(:xpath,'//*[@id="closeButton"]').click
sleep 1
column=column+1
end
$driver.switch_to.default_content()
$driver.switch_to.frame("i_right")
$driver.switch_to.frame("tab_inner_iframe")
$driver.switch_to.frame("addListIframe")
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tfoot/tr[3]/td[5]/a').click
$driver.switch_to.default_content()
$driver.switch_to.frame("arch_popup_iframe0")
$driver.find_element(:xpath,'/html/body/div/div/div[2]/div[2]/div/ul/li[3]').click#汇总映射列
$driver.switch_to.frame("tab_inner_iframe")
$driver.find_element(:xpath,'/html/body/form/center/button').click#新增映射列
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option[2]').click#是否自汇总
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[3]/td[4]/select/option[2]').click#汇总条件
$driver.find_element(:xpath,'/html/body/form/div/div/center/button').click
alert.accept()
sleep 1
$driver.find_element(:xpath,'//*[@id="closeButton"]').click
sleep 1

