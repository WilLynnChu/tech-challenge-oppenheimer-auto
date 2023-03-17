*** Settings ***
Documentation    Login keyword file
Library    SeleniumLibrary
Library    OperatingSystem
Library    String
Resource    ../objectRepository/loginObject.robot

*** Keywords ***
Get Credentials
    [Arguments]    ${role}
    ${credentialJsonFile}=     Get File    ./data/credential.json
    ${credentialJsonData}=    Evaluate    json.loads('''${credentialJsonFile}''')    json
    FOR    ${item}   IN  @{credentialJsonData}
        IF    '${item}[role]' == '${role}'
            ${username}     Set Variable    ${item}[username]
            ${password}     Set Variable    ${item}[password]
        END
    END
    [Return]    ${username}     ${password}

Login Action
    [Arguments]    ${username}  ${password}
    Wait Until Element Is Visible    ${label_title_login}
    Input Text          ${input_username_login}     ${username}
    Input Password      ${input_password_login}     ${password}
    Click Element       ${btn_submit_login}

Login Common
    [Arguments]    ${role}
    ${username}  ${password}    Get Credentials    ${role}
    ${label_title_object}   Get Title Dashboard Object    ${role}
    Login Action    ${username}     ${password}
    Wait Until Element Is Visible    ${label_title_object}

Login As Clerk
    Login Common    Clerk
    Sleep    3

Login As Book Keeper
    Login Common    Book Keeper
    Sleep    3

Login As Governor
    Login Common    Governor
    Sleep    3

Login With Invalid Credential
    Login Action    will    pwd
    Wait Until Element Is Visible    ${label_failed_login}