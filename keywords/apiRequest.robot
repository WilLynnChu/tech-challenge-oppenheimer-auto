*** Settings ***
Documentation       Keyword file for API requests
Library             RequestsLibrary
Library             OperatingSystem
Resource            ../objectRepository/requestObject.robot

*** Variables ***
${validHeroPath}     ${EXECDIR}/data/validSingleHeroData.json
${invalidHeroPath}    ${EXECDIR}/data/invalidSingleHeroData.json

*** Keywords ***
Post Insert Valid Hero Record
    ${validHeroData}=     Get File    ${validHeroPath}
    ${dataJson}=     Evaluate        json.loads('''${validHeroData}''')    json
    ${response}=    POST    ${api_post_insert_hero_record}   json=${dataJson}    expected_status=200
    Log    \n${response}\n${response.json()}

Post Insert Invalid Hero Record
    ${invalidHeroData}=     Get File    ${invalidHeroPath}
    ${dataJson}=     Evaluate        json.loads('''${invalidHeroData}''')    json
    ${response}=    POST    ${api_post_insert_hero_record}   json=${dataJson}    expected_status=400
    ${errorMsg}     Set Variable    ${response.json()}[errorMsg]
    Should Be Equal As Strings    ${errorMsg}   Working Class Hero of natid: natid-1 already exists!
    Log    \n${response}\n${response.json()}