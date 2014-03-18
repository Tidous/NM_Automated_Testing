#encoding : gbk
$DEBUG =1
require 'selenium-webdriver'
require 'rubygems'
require './NM_login'
require './NM_alert'

module Budget
     class Budget
	     def locate_budget_making(kind)
		     #kindΪԤ������࣬y����ȣ�m���ڼ䣬d�ǲ��ţ�c�ǹ�˾
		     $driver.switch_to().frame("i_right")
		     $driver.switch_to().frame("i_apply")
		     $driver.find_element(:xpath,'//*[@id="8ad7c21a3b45dd2d013b461389b40008"]').click
		     #ʹ����תiframe�ķ�ʽ��seleniumǿ�Ƽ���iframe
		     $driver.find_element(:xpath,'/html/body/div/div[2]/div/div[2]/div[6]/ul/li[7]/a').click
		     #��λԤ�����
		     sleep 1
		     if kind =="yd" 
			     $driver.find_element(:xpath,'/html/body/div/div[2]/div/div[2]/ul/li/a').click
		     end
		     if kind =="yc" 
			     $driver.find_element(:xpath,'/html/body/div/div[2]/div/div[2]/ul/li[2]/a').click
		     end
		     if kind =="md" 
			     $driver.find_element(:xpath,'/html/body/div/div[2]/div/div[2]/ul/li[3]/a').click
		     end
		     if kind =="yc" 
			     $driver.find_element(:xpath,'/html/body/div/div[2]/div/div[2]/ul/li[4]/a').click
		     end
		     sleep 1
	     end
	     def annual_department_budget_add(tid,cname,dname,year=1,btype=1)
		     #tidΪģ���ţ�cnameΪ��˾����
		     #dnameΪ�������ƣ�yearΪ��ȣ�1Ϊ2016��2Ϊ2015���Դ����ƣ�btypeΪԤ������
	             $driver.switch_to.default_content()
		     $driver.switch_to.frame("i_right")
		     $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/div[2]/div/div[2]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
		     #����Ԥ��
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     sleep 1
		     $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/table/tbody/tr/td[2]/select/option['+year.to_s+']').click
		     #Ԥ�����
		     $driver.find_element(:xpath,'//*[@id="budgetType"]/option['+btype.to_s+']').click
		     #Ԥ������
		     $driver.find_element(:xpath,'//*[@id="templateNameImg"]').click
		     #Ԥ��ģ��Ŵ�
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe1")
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/div/table/tbody/tr/td[2]/input').send_keys(tid)
		     #����ģ��id��ѯ
		     $driver.find_element(:xpath,'//*[@id="btnQueryID1"]').click
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div/div[3]/div[2]/table/tbody/tr[3]/td/input').click
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
		     #ѡ��Ԥ��ģ��ȷ��
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.find_element(:xpath,'//*[@id="companyNameImg"]').click
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe1")
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/div/table/tbody/tr/td[2]/input').send_keys(cname)
		     $driver.find_element(:xpath,'//*[@id="btnQueryID1"]').click
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div/div[3]/div[2]/table/tbody/tr[2]/td/input').click
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.find_element(:xpath,'//*[@id="departmentNameImg"]').click
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe1")
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/div/table/tbody/tr/td[2]/input').send_keys(dname)
		     $driver.find_element(:xpath,'//*[@id="btnQueryID1"]').click
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div/div[3]/div[2]/table/tbody/tr[2]/td/input').click
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.find_element(:xpath,'//*[@id="saveButton"]').click
		     sleep 1
		     alert=Alert::Alert.new
		     alert.accept
		     sleep 1
	     end
     end
end