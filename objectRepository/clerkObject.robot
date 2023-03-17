*** Settings ***
Documentation    Object repository for clerk page
Library    SeleniumLibrary

*** Variables ***

#Buttons
${btn_create_upload_clerk}          //button[normalize-space()='Create']
${btn_back_upload_clerk}            //a[normalize-space()='Back']

#Dropdown
${dropdown_add_hero_clerk}          //button[@id='dropdownMenuButton2']
${dropdown_option_upload_clerk}     //a[normalize-space()='Upload a csv file']

#Inputs
${input_upload_csv_path_clerk}      //input[@id='upload-csv-file']

#Labels
${label_warning_title_clerk}        //div[@class='bg-warning pt-2']/h3[text()='Unable to create hero!']
${label_warning_message_clerk}      //div[@class='bg-warning pt-2']/descendant::p[text() = 'Unable to process csv file! Please contact tech support for help!']
${label_success_message_clerk}      //div[@id='notification-block']/div[@class='bg-success pt-2']/h3[text() = 'Created Successfully!']
${label_error_message_clerk}        //div[@class='bg-warning pt-2']/descendant::p