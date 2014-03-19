#encoding:utf-8
$DEBUG =1
require 'selenium-webdriver'
require 'rubygems'
require './NM_login'
require './NM_alert'

module Budget
  class Budget
    def locate_budget_making(kind)
      #kind为预算的种类，y是年度，m是期间，d是部门，c是公司
      $driver.switch_to().frame("i_right")
      $driver.switch_to().frame("i_apply")
      $driver.find_element(:xpath,'//*[@id="8ad7c21a3b45dd2d013b461389b40008"]').click
      #使用跳转iframe的方式让selenium强制加载iframe
      $driver.find_element(:xpath,'/html/body/div/div[2]/div/div[2]/div[6]/ul/li[7]/a').click
      #定位预算编制
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
      if kind =="mc"
        $driver.find_element(:xpath,'/html/body/div/div[2]/div/div[2]/ul/li[4]/a').click
      end
      sleep 1
    end

    def annual_department_budget_add(tid,cname,dname,year=1,ttype=1,btype=1)
      #tid为模板编号，cname为公司名称
      #dname为部门名称，year为年度，1为2016，2为2015年以此类推，btype为预算类型
      $driver.switch_to.default_content()
      $driver.switch_to.frame("i_right")
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/div[2]/div/div[2]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
      #新增预算
      $driver.switch_to.default_content()
      $driver.switch_to.frame("arch_popup_iframe0")
      sleep 1
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/table/tbody/tr/td[2]/select/option['+year.to_s+']').click
      #预算年度
      $driver.find_element(:xpath,'//*[@id="budgetType"]/option['+btype.to_s+']').click
      #预算类型
      $driver.find_element(:xpath,'//*[@id="templateNameImg"]').click
      #预算模板放大镜
      sleep 1
      $driver.switch_to.default_content()
      $driver.switch_to.frame("arch_popup_iframe1")
      $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/div/table/tbody/tr/td[2]/input').send_keys(tid)
      #输入模板id查询
      $driver.find_element(:xpath,'//*[@id="btnQueryID1"]').click
      $driver.find_element(:xpath,'/html/body/form/div[2]/div/div/div[3]/div[2]/table/tbody/tr[3]/td/input').click
      $driver.find_element(:xpath,'/html/body/form/div[2]/div/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
      #选择预算模板确定
      sleep 1
      $driver.switch_to.default_content()
      $driver.switch_to.frame("arch_popup_iframe0")
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/table/tbody/tr[2]/td[4]/select/option['+ttype.to_s+']').click
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

    def annual_company_budget_add(tid,cname,year=1,ttype=1,btype=1)
      #tid为模版编号，cname为公司名称，year为年度，ttype为模板类型，btype为预算类型
      $driver.switch_to.default_content()
      $driver.switch_to.frame("i_right")
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/div[2]/div/div[2]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
      #新增预算
      $driver.switch_to.default_content()
      $driver.switch_to.frame("arch_popup_iframe0")
      sleep 1
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/table/tbody/tr/td[2]/select/option['+year.to_s+']').click
      #预算年度
      $driver.find_element(:xpath,'//*[@id="budgetType"]/option['+btype.to_s+']').click
      #预算类型
      $driver.find_element(:xpath,'//*[@id="templateNameImg"]').click
      #预算模板放大镜
      sleep 1
      $driver.switch_to.default_content()
      $driver.switch_to.frame("arch_popup_iframe1")
      $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/div/table/tbody/tr/td[2]/input').send_keys(tid)
      #输入模板id查询
      $driver.find_element(:xpath,'//*[@id="btnQueryID1"]').click
      $driver.find_element(:xpath,'/html/body/form/div[2]/div/div/div[3]/div[2]/table/tbody/tr[3]/td/input').click
      $driver.find_element(:xpath,'/html/body/form/div[2]/div/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
      #选择预算模板确定
      sleep 1
      $driver.switch_to.default_content()
      $driver.switch_to.frame("arch_popup_iframe0")
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/table/tbody/tr[2]/td[4]/select/option['+ttype.to_s+']').click
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
      $driver.find_element(:xpath,'//*[@id="saveButton"]').click
      sleep 1
      alert=Alert::Alert.new
      alert.accept
      sleep 1
    end

    def period_department_budget_add(tid,cname,dname,year=1,periodtype=1,frequencytype=2,ttype=1,btype=1)
      #tid为模板编号，cname为公司名称
      #dname为部门名称，periodtype为期间类型，frequencytype为期间，btype为预算类型，ttype为模板类型
      $driver.switch_to.default_content()
      $driver.switch_to.frame("i_right")
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/div[2]/div/div[2]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
      #新增预算
      $driver.switch_to.default_content()
      $driver.switch_to.frame("arch_popup_iframe0")
      sleep 1
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/table/tbody/tr/td[2]/select/option['+year.to_s+']').click
      $driver.find_element(:xpath,'//*[@id="templateNameImg"]').click
      #预算模板放大镜
      sleep 1
      $driver.switch_to.default_content()
      $driver.switch_to.frame("arch_popup_iframe1")
      $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/div/table/tbody/tr/td[2]/input').send_keys(tid)
      #输入模板id查询
      $driver.find_element(:xpath,'//*[@id="btnQueryID1"]').click
      $driver.find_element(:xpath,'/html/body/form/div[2]/div/div/div[3]/div[2]/table/tbody/tr[3]/td/input').click
      $driver.find_element(:xpath,'/html/body/form/div[2]/div/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
      #选择预算模板确定
      sleep 1
      $driver.switch_to.default_content()
      $driver.switch_to.frame("arch_popup_iframe0")
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/table/tbody/tr[2]/td[4]/select/option['+ttype.to_s+']').click
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/table/tbody/tr[2]/td[2]/select/option['+periodtype.to_s+']').click
      #预算期间
      sleep 1
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/table/tbody/tr[2]/td[4]/select/option['+frequencytype.to_s+']').click
      #期间值
      $driver.find_element(:xpath,'//*[@id="budgetType"]/option['+btype.to_s+']').click
      #预算类型
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

    def period_company_budget_add(tid,cname,year=1,periodtype=1,frequencytype=2,ttype=1,btype=1)
      #tid为模板编号，cname为公司名称
      #periodtype为期间类型，frequencytype为期间，btype为预算类型，ttype为模板类型
      $driver.switch_to.default_content()
      $driver.switch_to.frame("i_right")
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/div[2]/div/div[2]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
      #新增预算
      $driver.switch_to.default_content()
      $driver.switch_to.frame("arch_popup_iframe0")
      sleep 1
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/table/tbody/tr/td[2]/select/option['+year.to_s+']').click
      $driver.find_element(:xpath,'//*[@id="templateNameImg"]').click
      #预算模板放大镜
      sleep 1
      $driver.switch_to.default_content()
      $driver.switch_to.frame("arch_popup_iframe1")
      $driver.find_element(:xpath,'/html/body/form/div/div/fieldset/div/table/tbody/tr/td[2]/input').send_keys(tid)
      #输入模板id查询
      $driver.find_element(:xpath,'//*[@id="btnQueryID1"]').click
      $driver.find_element(:xpath,'/html/body/form/div[2]/div/div/div[3]/div[2]/table/tbody/tr[3]/td/input').click
      $driver.find_element(:xpath,'/html/body/form/div[2]/div/div/div[3]/div/table/tbody/tr/td/table/tbody/tr/td[2]/button').click
      #选择预算模板确定
      sleep 1
      $driver.switch_to.default_content()
      $driver.switch_to.frame("arch_popup_iframe0")
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/table/tbody/tr[2]/td[4]/select/option['+ttype.to_s+']').click
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/table/tbody/tr[2]/td[2]/select/option['+periodtype.to_s+']').click
      #预算期间
      sleep 1
      $driver.find_element(:xpath,'/html/body/div/div/div[2]/form/table/tbody/tr[2]/td[4]/select/option['+frequencytype.to_s+']').click
      #期间值
      $driver.find_element(:xpath,'//*[@id="budgetType"]/option['+btype.to_s+']').click
      #预算类型
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
      $driver.find_element(:xpath,'//*[@id="saveButton"]').click
      sleep 1
      alert=Alert::Alert.new
      alert.accept
      sleep 1
    end
  end
end