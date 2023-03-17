*** Settings ***
Documentation    Object repository for governor page

*** Variables ***
#Buttons
${btn_list_all_governor}                    //button[normalize-space()='List ALL!!']
${btn_search_summary_governor}              //button[normalize-space()='Search']

#Inputs
${input_search_summary_governor}            //input[@id='natid']
${input_search_list_governor}               //input[@placeholder='Enter name or natid here...']

#Labels
${label_natid_result_governor}              //td[normalize-space()='natid-9']
${label_natid_negative_result_governor}     //td[normalize-space()='natid-1']
${label_name_result_governor}               //td[normalize-space()='natid-9']/following-sibling::td[text()='Maureen White']
${label_gender_result_governor}             //td[normalize-space()='natid-9']/following-sibling::td[text()='MALE']
${label_birth_date_result_governor}         //td[normalize-space()='natid-9']/following-sibling::td[text()='1997-02-07']
${label_salary_result_governor}             //td[normalize-space()='natid-9']/following-sibling::td[text()='82083.09']
${label_tax_paid_result_governor}           //td[normalize-space()='natid-9']/following-sibling::td[text()='22492.34']
${label_natid_summary_governor}             //th[@id='row-id']
${label_name_summary_governor}              //th[@id='row-name']
${label_salary_summary_governor}            //th[@id='row-salary']
