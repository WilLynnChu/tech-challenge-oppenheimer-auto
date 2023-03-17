*** Settings ***
Documentation    Object repository for login page
Library    SeleniumLibrary

*** Variables ***

#Buttons
${btn_submit_login}         //input[@type='submit']

#Inputs
${input_username_login}     id:username-in
${input_password_login}     id:password-in

#Labels
${label_title_login}        //h1[normalize-space()='Working Class Hero System']
${label_failed_login}       //div[text() = 'Unable to log in successfully!']

*** Keywords ***
Get Title Dashboard Object
    [Arguments]    ${role}
    ${label_title_dashboard}    Set Variable    //h1[normalize-space()='${role} Dashboard']
    [Return]    ${label_title_dashboard}