#encoding : gbk
$DEBUG =1
require 'selenium-webdriver'
require 'rubygems'
require './NM_login'

module Template
     class Template
	     def locate_budget_template()
		     $driver.switch_to().frame("i_right")
		     $driver.switch_to().frame("i_apply")
		     $driver.find_element(:xpath,'//*[@id="8ad7c21a3b45dd2d013b461389b40008"]').click
		     #ʹ����תiframe�ķ�ʽ��seleniumǿ�Ƽ���iframe
		     $driver.find_element(:xpath,'//div[@id="8ad7c21a3b45dd2d013b461389b40008"]/ul/li[11]').click
	             ##���϶�λԤ��ģ�嶨��
	     end
	     def locate_columnset()
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("i_right")
		     $driver.find_element(:xpath,'//*[@id="tab_1_li"]').click
		     #���϶�λ�����м�
	     end
	     def locate_rowset()
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("i_right")
		     $driver.find_element(:xpath,'//*[@id="tab_2_li"]').click
	     end
	     def columnset_add(cid,cname,layout_style=3)
		     #���У�cidΪ�м���ţ�cnameΪ�м����ƣ�layout_styleΪ���ַ�ʽ��1Ϊȫ����2Ϊ��̬�У�3Ϊ�̶��У�Ĭ��Ϊ3��
		     $driver.switch_to().frame("tab_inner_iframe")
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
		     #���϶�λ�����м�
		     $driver.find_element(:xpath,'//*[@id="templateColumnSetNumber"]').send_keys(cid)
		     $driver.find_element(:xpath,'//*[@id="templateColumnSetName"]').send_keys(cname)
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[6]/select/option['+layout_style.to_s+']').click
		     $driver.find_element(:xpath,'//*[@id="saveButton"]').click
		     #���붥���м���Ϣ����
	     end
	     def rowset_add(rid,rname,rabove)
		     #ridΪ�м���ţ�rnameΪ�м����ƣ�raboveΪ����������
		     $driver.switch_to().frame("tab_inner_iframe")
		     $driver.find_element(:xpath,'/html/body/form/div[4]/div/div[2]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
		     #���϶�λ�����м�
		     $driver.find_element(:xpath,'//*[@id="templateRowSetNumber"]').send_keys(rid)
		     $driver.find_element(:xpath,'//*[@id="templateRowSetName"]').send_keys(rname)
		     $driver.find_element(:xpath,'//*[@id="saveButton"]').click
		     #���붥���м���Ϣ����
		     $driver.switch_to.frame("iframe")
		     $driver.find_element(:xpath,'/html/body/form/div[2]/table/tbody/tr/td[2]/a').click
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.find_element(:xpath,'//*[@id="rowAbovePrompt"]').send_keys(rabove)
		     $driver.find_element(:xpath,'/html/body/form/div/div/div[3]/table/tfoot/tr/td/center/button').click
		     sleep 1
	     end
	     def rowadd(rlabel,rlength=15,rprecision=2,formula="")
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("i_right")
		     $driver.switch_to.frame("tab_inner_iframe")
		     $driver.switch_to.frame("iframe")
		     $driver.find_element(:xpath,'/html/body/form/div[2]/table/tbody/tr/td[2]/img[2]').click
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.switch_to.frame("tab_inner_iframe")
		     $driver.find_element(:xpath,'//*[@id="rowLabel"]').send_keys(rlabel)#�б���
		     $driver.find_element(:xpath,'//*[@id="labelIndentation"]').send_keys(rlength)#����������
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[3]/td[4]/span/input[2]').click#�Ƿ������ֹ���д
		     $driver.find_element(:xpath,'//*[@id="numberPrecision"]').send_keys(rprecision)#���־���
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[5]/td[2]/span/input').click#�����ü���
		     $driver.find_element(:xpath,'//*[@id="calculationFormulaText"]').send_keys(formula)#���㹫ʽ
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[6]/td[2]/span/input').click#�������ϵĹ�ʽ
		     $driver.find_element(:xpath,'//*[@id="saveButtonId"]').click
		     $driver.switch_to.alert().accept()
		     sleep 1
	     end
	     def template_add(tid,tname,ttype=1,tbudget_type=2)
		     #ttypeΪ�ϱ�ģ����´�ģ�壬tidΪģ���ţ�tnameΪģ�����ƣ�tbudget_typeΪԤ������
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("i_right")
		     $driver.switch_to.frame("tab_inner_iframe")
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click#����ģ��
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.find_element(:xpath,'//*[@id="templateNumber"]').send_keys(tid)#ģ����
		     $driver.find_element(:xpath,'//*[@id="templateName"]').send_keys(tname)#ģ������
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[6]/select/option['+ttype.to_s+']').click#ģ������Ԥ����
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option['+tbudget_type.to_s+']').click#Ԥ������
		     $driver.find_element(:xpath,'//*[@id="saveButton"]').click
		     $driver.switch_to.alert().accept()
		     sleep 2
	     end
	     def layout_stable_add(lid,lname,rowset,columnset)
		     #lidΪ���ֱ�ţ�lnameΪ�������ƣ�rowsetΪ�м�����columnsetΪ�м���
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("i_right")
		     $driver.switch_to.frame("tab_inner_iframe")
		     $driver.find_element(:xpath,'/html/body/form/div[3]/div/ul/li/img').click#��������
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.find_element(:xpath,'//*[@id="templateLayoutNumber"]').send_keys(lid)#��������
		     $driver.find_element(:xpath,'//*[@id="templateLayoutName"]').send_keys(lname)#��������
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option[3]').click#�̶���ģ��
		     $driver.find_element(:xpath,'//*[@id="templateRowSetIdImg"]').click#ѡ���м�
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe1")
		     $driver.find_element(:xpath,'//*[@id="templateRowSetNumber"]').send_keys(rowset)#�����м����ȷ����ѯ
		     $driver.find_element(:xpath,'//*[@id="searchButton"]').click
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div[3]/div[2]/table/tbody/tr[2]/td/input').click#ѡȡ�м�
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.find_element(:xpath,'//*[@id="templateColumnSetIdImg"]').click#ѡ���м�
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe1")
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/div/table/tbody/tr/td[2]/input').send_keys(columnset)#�����м���Ų�ѯ
		     $driver.find_element(:xpath,'//*[@id="searchButton"]').click
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div[3]/div[2]/table/tbody/tr[2]/td/input').click#ѡȡ�м�
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.find_element(:xpath,'//*[@id="saveButton"]').click
		     $driver.switch_to.alert().accept()
		     sleep 2
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("i_right")
		     $driver.switch_to.frame("tab_inner_iframe")
		     $driver.find_element(:xpath,'//*[@id="refreshButton"]').click
	     end
	     def layout_dynamic_add(lid,lname,columnset)
		     #lidΪ���ֱ��
		     #lnameΪ�������ƣ�columnsetΪ�м���
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("i_right")
		     $driver.switch_to.frame("tab_inner_iframe")
		     $driver.find_element(:xpath,'/html/body/form/div[3]/div/ul/li/img').click#��������
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.find_element(:xpath,'//*[@id="templateLayoutNumber"]').send_keys(lid)#��������
		     $driver.find_element(:xpath,'//*[@id="templateLayoutName"]').send_keys(lname)#��������
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option[2]').click
		     $driver.find_element(:xpath,'//*[@id="templateColumnSetIdImg"]').click#ѡ���м�
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe1")
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/div/table/tbody/tr/td[2]/input').send_keys(columnset)#�����м���Ų�ѯ
		     $driver.find_element(:xpath,'//*[@id="searchButton"]').click
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div[3]/div[2]/table/tbody/tr[2]/td/input').click#ѡȡ�м�ȷ��
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.find_element(:xpath,'//*[@id="saveButton"]').click
		     $driver.switch_to.alert().accept()
		     sleep 2
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("i_right")
		     $driver.switch_to.frame("tab_inner_iframe")
		     $driver.find_element(:xpath,'//*[@id="refreshButton"]').click
	     end
	     
     end
end