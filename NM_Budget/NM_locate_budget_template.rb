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
		     #使用跳转iframe的方式让selenium强制加载iframe
		     $driver.find_element(:xpath,'//div[@id="8ad7c21a3b45dd2d013b461389b40008"]/ul/li[11]').click
	             ##以上定位预算模板定义
	     end
	     def locate_columnset()
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("i_right")
		     $driver.find_element(:xpath,'//*[@id="tab_1_li"]').click
		     #以上定位新增列集
	     end
	     def locate_rowset()
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("i_right")
		     $driver.find_element(:xpath,'//*[@id="tab_2_li"]').click
	     end
	     def columnset_add(cid,cname,layout_style=3)
		     #其中，cid为列集编号，cname为列集名称，layout_style为布局方式（1为全部，2为动态行，3为固定行，默认为3）
		     $driver.switch_to().frame("tab_inner_iframe")
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
		     #以上定位新增列集
		     $driver.find_element(:xpath,'//*[@id="templateColumnSetNumber"]').send_keys(cid)
		     $driver.find_element(:xpath,'//*[@id="templateColumnSetName"]').send_keys(cname)
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[6]/select/option['+layout_style.to_s+']').click
		     $driver.find_element(:xpath,'//*[@id="saveButton"]').click
		     #输入顶层列集信息保存
	     end
	     def rowset_add(rid,rname,rabove)
		     #rid为行集编号，rname为行集名称，rabove为顶级行名称
		     $driver.switch_to().frame("tab_inner_iframe")
		     $driver.find_element(:xpath,'/html/body/form/div[4]/div/div[2]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
		     #以上定位新增行集
		     $driver.find_element(:xpath,'//*[@id="templateRowSetNumber"]').send_keys(rid)
		     $driver.find_element(:xpath,'//*[@id="templateRowSetName"]').send_keys(rname)
		     $driver.find_element(:xpath,'//*[@id="saveButton"]').click
		     #输入顶层行集信息保存
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
		     $driver.find_element(:xpath,'//*[@id="rowLabel"]').send_keys(rlabel)#行标题
		     $driver.find_element(:xpath,'//*[@id="labelIndentation"]').send_keys(rlength)#标题缩进量
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[3]/td[4]/span/input[2]').click#是否允许手工填写
		     $driver.find_element(:xpath,'//*[@id="numberPrecision"]').send_keys(rprecision)#数字精度
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[5]/td[2]/span/input').click#不启用计算
		     $driver.find_element(:xpath,'//*[@id="calculationFormulaText"]').send_keys(formula)#计算公式
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[6]/td[2]/span/input').click#启用列上的公式
		     $driver.find_element(:xpath,'//*[@id="saveButtonId"]').click
		     $driver.switch_to.alert().accept()
		     sleep 1
	     end
	     def template_add(tid,tname,ttype=1,tbudget_type=2)
		     #ttype为上报模板和下达模板，tid为模板编号，tname为模板名称，tbudget_type为预算类型
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("i_right")
		     $driver.switch_to.frame("tab_inner_iframe")
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click#新增模板
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.find_element(:xpath,'//*[@id="templateNumber"]').send_keys(tid)#模板编号
		     $driver.find_element(:xpath,'//*[@id="templateName"]').send_keys(tname)#模板名称
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr/td[6]/select/option['+ttype.to_s+']').click#模板类型预定义
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option['+tbudget_type.to_s+']').click#预算类型
		     $driver.find_element(:xpath,'//*[@id="saveButton"]').click
		     $driver.switch_to.alert().accept()
		     sleep 2
	     end
	     def layout_stable_add(lid,lname,rowset,columnset)
		     #lid为布局编号，lname为布局名称，rowset为行集名，columnset为列集名
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("i_right")
		     $driver.switch_to.frame("tab_inner_iframe")
		     $driver.find_element(:xpath,'/html/body/form/div[3]/div/ul/li/img').click#新增布局
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.find_element(:xpath,'//*[@id="templateLayoutNumber"]').send_keys(lid)#布局名称
		     $driver.find_element(:xpath,'//*[@id="templateLayoutName"]').send_keys(lname)#布局名称
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option[3]').click#固定行模板
		     $driver.find_element(:xpath,'//*[@id="templateRowSetIdImg"]').click#选择行集
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe1")
		     $driver.find_element(:xpath,'//*[@id="templateRowSetNumber"]').send_keys(rowset)#输入行集编号确定查询
		     $driver.find_element(:xpath,'//*[@id="searchButton"]').click
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div[3]/div[2]/table/tbody/tr[2]/td/input').click#选取行集
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
		     sleep 1
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.find_element(:xpath,'//*[@id="templateColumnSetIdImg"]').click#选择列集
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe1")
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/div/table/tbody/tr/td[2]/input').send_keys(columnset)#输入列集编号查询
		     $driver.find_element(:xpath,'//*[@id="searchButton"]').click
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div[3]/div[2]/table/tbody/tr[2]/td/input').click#选取列集
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
		     #lid为布局编号
		     #lname为布局名称，columnset为列集名
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("i_right")
		     $driver.switch_to.frame("tab_inner_iframe")
		     $driver.find_element(:xpath,'/html/body/form/div[3]/div/ul/li/img').click#新增布局
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe0")
		     $driver.find_element(:xpath,'//*[@id="templateLayoutNumber"]').send_keys(lid)#布局名称
		     $driver.find_element(:xpath,'//*[@id="templateLayoutName"]').send_keys(lname)#布局名称
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/table/tbody/tr[2]/td[2]/select/option[2]').click
		     $driver.find_element(:xpath,'//*[@id="templateColumnSetIdImg"]').click#选择列集
		     $driver.switch_to.default_content()
		     $driver.switch_to.frame("arch_popup_iframe1")
		     $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/div/table/tbody/tr/td[2]/input').send_keys(columnset)#输入列集编号查询
		     $driver.find_element(:xpath,'//*[@id="searchButton"]').click
		     $driver.find_element(:xpath,'/html/body/form/div[2]/div/div[3]/div[2]/table/tbody/tr[2]/td/input').click#选取列集确定
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