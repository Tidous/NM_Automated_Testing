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
#ȷ������ɹ�
array=["һ��","����","����"]
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
$driver.find_element(:xpath,'//*[@id="columnLabel"]').send_keys(array[i])#�б���
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[4]/div/select/option').click#�Ƿ���б���
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[6]/div/select/option[2]').click#�Ƿ������
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option[2]').click#�Ƿ���ʾ
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[4]/select/option[2]').click#�Ƿ������ֹ���д
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr/td[2]/select/option[5]').click#�龰
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr/td[4]/select/option['+j.to_s+']').click#ֵ����
#$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr[2]/td[2]/select/option[2]').click#γ������
#$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr[2]/td[4]/select/option[4]').click#γ�ȼ�
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[3]/table/tbody/tr/td[2]/select/option').click#�Ƿ����ü���
$driver.find_element(:xpath,'//*[@id="calculationFormulaText"]').send_keys("")#������㹫ʽ
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[3]/table/tbody/tr[2]/td[2]/span/input[2]').click#���������ϵļ��㹫ʽ
$driver.find_element(:xpath,'//*[@id="saveButton"]').click#����
#�������У�ͨ��ƴ��xpath�������龰ֵ��ѭ��
alert.accept()
sleep 2
#$driver.find_element(:xpath,'//*[@id="tab_2_li"]').click
#$driver.find_element(:xpath,'//*[@id="addNewColumnMapping"]').click
#$driver.find_element(:xpath,'//*[@id="selfConsolidationFlag"]').click
#$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[3]/td[4]/select/option[4]').click
#$driver.find_element(:xpath,'//*[@id="saveButton"]').click
#$driver.switch_to.alert().accept()
#$driver.find_element(:xpath,'//*[@id="closeButton"]').click
$driver.find_element(:xpath,'//*[@id="closeButton"]').click#ȡ�����������ҳ��
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
$driver.find_element(:xpath,'//*[@id="columnLabel"]').send_keys("�ϱ����")
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[4]/div/select/option').click#�Ƿ���б���
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[6]/div/select/option[2]').click#�Ƿ������
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option[2]').click#�Ƿ���ʾ
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[4]/select/option[2]').click#�Ƿ������ֹ���д
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr/td[2]/select/option[5]').click#�龰
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr/td[4]/select/option[2]').click#ֵ����
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[3]/table/tbody/tr/td[2]/select/option[2]').click#�Ƿ����ü���
$driver.find_element(:xpath,'//*[@id="calculationFormulaText"]').send_keys('C["һ��"]+C["����"]+C["����"]')#������㹫ʽ
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[3]/table/tbody/tr[2]/td[2]/span/input[2]').click#���������ϵļ��㹫ʽ
$driver.find_element(:xpath,'//*[@id="saveButton"]').click#����
#�����ϱ�������
alert.accept()
sleep 1
$driver.find_element(:xpath,'//*[@id="closeButton"]').click#ȡ�����������ҳ��
sleep 1
$driver.switch_to.default_content()
$driver.switch_to.frame("i_right")
$driver.switch_to.frame("tab_inner_iframe")
$driver.switch_to.frame("addListIframe")
$driver.find_element(:xpath,'//*[@id="addButton"]').click
$driver.switch_to.default_content()
$driver.switch_to.frame("arch_popup_iframe0")
$driver.switch_to.frame("tab_inner_iframe")
$driver.find_element(:xpath,'//*[@id="columnLabel"]').send_keys("��ע")
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[4]/div/select/option').click#�Ƿ���б���
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[6]/div/select/option[2]').click#�Ƿ������
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option[2]').click#�Ƿ���ʾ
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[4]/select/option[2]').click#�Ƿ������ֹ���д
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr/td[2]/select/option[2]').click#������
#$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr/td[4]/select/option[2]').click#ֵ����
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[2]/table/tbody/tr/td[6]/select/option[4]').click#��������
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[3]/table/tbody/tr/td[2]/select/option').click#�Ƿ����ü���
$driver.find_element(:xpath,'//*[@id="calculationFormulaText"]').send_keys("")#������㹫ʽ
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset[3]/table/tbody/tr[2]/td[2]/span/input[2]').click#���������ϵļ��㹫ʽ
$driver.find_element(:xpath,'//*[@id="saveButton"]').click#����
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
$driver.find_element(:xpath,'/html/body/div/div/div[2]/div[2]/div/ul/li[3]').click#����ӳ����
$driver.switch_to.frame("tab_inner_iframe")
$driver.find_element(:xpath,'/html/body/form/center/button').click#����ӳ����
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option[2]').click#�Ƿ��Ի���
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[3]/td[4]/select/option[4]').click#��������
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
$driver.find_element(:xpath,'/html/body/div/div/div[2]/div[2]/div/ul/li[3]').click#����ӳ����
$driver.switch_to.frame("tab_inner_iframe")
$driver.find_element(:xpath,'/html/body/form/center/button').click#����ӳ����
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option[2]').click#�Ƿ��Ի���
$driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[3]/td[4]/select/option[2]').click#��������
$driver.find_element(:xpath,'/html/body/form/div/div/center/button').click
alert.accept()
sleep 1
$driver.find_element(:xpath,'//*[@id="closeButton"]').click
sleep 1

