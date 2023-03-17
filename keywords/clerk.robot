*** Settings ***
Documentation       Clerk keyword file
Library             SeleniumLibrary
Library             OperatingSystem
Resource            ../objectRepository/clerkObject.robot
Resource            ../keywords/generateCSV.robot

*** Variables ***
${validHeroesCSVPath}           ${EXECDIR}/data/validHeroesData.csv
${invalidHeroesCSVPath}         ${EXECDIR}/data/invalidDateData.csv
${validSingleHeroCSVPath}       ${EXECDIR}/data/validSingleHeroData.csv
${outputCSVPath}                ${EXECDIR}/data/generatedData.csv

*** Keywords ***
Upload Common Flow
    [Arguments]     ${dataPath}
    Click Element   ${dropdown_add_hero_clerk}
    Click Element   ${dropdown_option_upload_clerk}
    Choose File     ${input_upload_csv_path_clerk}      ${dataPath}
    Click Element   ${btn_create_upload_clerk}

Upload Valid Heroes To Working Class Heroes
    Upload Common Flow    ${validHeroesCSVPath}
    Wait Until Element Is Visible    ${label_success_message_clerk}
    Click Element   ${btn_back_upload_clerk}

Upload Invalid Heroes With Earlier Death Date Than Birth Date
    Upload Common Flow    ${invalidHeroesCSVPath}
    Wait Until Element Is Visible   ${label_warning_title_clerk}
    Wait Until Element Is Visible   ${label_error_message_clerk}
    ${actualErrorMessage}           Get Text    ${label_error_message_clerk}
    ${expectedErrorMessage}         Get Expected Error Message    2
    Should Be Equal As Strings      ${actualErrorMessage}     ${expectedErrorMessage}

Upload Heroes With Invalid Natid Syntax
    Duplicate CSV File And Replace Invalid Natid      ${validSingleHeroCSVPath}    ${outputCSVPath}     "Syntax"
    Upload Common Flow    ${outputCSVPath}
    Wait Until Element Is Visible    ${label_warning_title_clerk}
    Wait Until Element Is Visible    ${label_warning_message_clerk}

Upload Heroes With Invalid Natid Length
    Duplicate CSV File And Replace Invalid Natid      ${validSingleHeroCSVPath}    ${outputCSVPath}     "Length"
    Upload Common Flow    ${outputCSVPath}
    Wait Until Element Is Visible    ${label_warning_title_clerk}
    Wait Until Element Is Visible    ${label_warning_message_clerk}

Get Expected Error Message
    [Arguments]    ${numberOfRecordsFailed}
    ${expectedErrorMessage}    Set Variable    //p[text()='There are ${numberOfRecordsFailed} records which were not persisted! Please contact tech support for help!']
    [Return]    ${expectedErrorMessage}