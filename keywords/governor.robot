*** Settings ***
Documentation   Governor keyword file
Library             SeleniumLibrary
Resource            ../objectRepository/governorObject.robot

*** Variables ***
${EXPECTED_NATID}   natid-9
${EXPECTED_NAME}    Maureen White
${EXPECTED_SALARY}      82083.09

*** Keywords ***
List All Heroes As Governor
    Click Element    ${btn_list_all_governor}

Search All Heroes List Via Natid
    Input Text    ${input_search_list_governor}   ${EXPECTED_NATID}
    Wait Until Page Does Not Contain Element    ${label_natid_negative_result_governor}     10

Search All Heroes List Via Name
    Input Text    ${input_search_list_governor}   ${EXPECTED_NAME}
    Wait Until Page Does Not Contain Element    ${label_natid_negative_result_governor}     10

Verify Searched User
    Sleep    2
    Wait Until Element Is Visible    ${label_natid_result_governor}     10
    Wait Until Element Is Visible    ${label_name_result_governor}
    Wait Until Element Is Visible    ${label_gender_result_governor}
    Wait Until Element Is Visible    ${label_birth_date_result_governor}
    Wait Until Element Is Visible    ${label_salary_result_governor}
    Wait Until Element Is Visible    ${label_tax_paid_result_governor}

Search Heroes Summary As Governor
    Input Text          ${input_search_summary_governor}  ${EXPECTED_NATID}
    Sleep    1
    Click Element       ${btn_search_summary_governor}

Verify Heroes Summary
    Wait Until Element Is Visible    ${label_natid_summary_governor}    10
    Sleep    1
    ${actual_natid_summary}     Get Text    ${label_natid_summary_governor}
    ${actual_name_summary}      Get Text    ${label_name_summary_governor}
    ${actual_salary_summary}    Get Text    ${label_salary_summary_governor}
    Should Be Equal As Strings    ${actual_natid_summary}       ${EXPECTED_NATID}
    Should Be Equal As Strings    ${actual_name_summary}        ${EXPECTED_NAME}
    Should Be Equal As Strings    ${actual_salary_summary}      ${EXPECTED_SALARY}