*** Settings ***
Library  String
Library  Collections
Library  OperatingSystem
Library  CSVLibrary

*** Variables ***
${natid}            0
${name}             1
${gender}           2
${birthDate}        3
${deathDate}        4
${salary}           5
${taxPaid}          6
${browniePoints}    7

*** Keywords ***
Convert List To Comma Seperated String
    [Arguments]  ${values}
    ${converted_values}  Evaluate  ",".join(${values})
    [Return]  ${converted_values}

Generate CSV File
    [Arguments]  ${data}    ${outputDataPath}
    ${index}    Evaluate    0
    FOR  ${row}  IN  @{data}
        ${row_values}  Convert List To Comma Seperated String   ${row}
        IF  ${index} == 0
            Create File  ${outputDataPath}   ${row_values}
        ELSE
            Append To File  ${outputDataPath}  \n${row_values}
        END
        ${index}    Evaluate    ${index} + 1
    END

Duplicate CSV File With One Extra Data
    [Arguments]    ${duplicateDataPath}     ${outputDataPath}
    @{oriData}     Read Csv File To List    ${duplicateDataPath}
    FOR    ${row}   IN  @{oriData}
        ${row_values}  Convert List To Comma Seperated String   ${row}
        Append To File    ${outputDataPath}  \n${row_values}
        ${duplicatedRow}    Set Variable    ${row}
    END
    ${modifiedData}     Create List
    FOR    ${item}  IN  @{duplicatedRow}
        Append To List  ${modifiedData}    ${item}
    END
    ${randomNatid}  Generate Random String    7     [NUMBERS]
    Set List Value          ${modifiedData}  ${natid}  natid-${randomNatid}
    Append To List          ${oriData}    ${modifiedData}
    Generate CSV File       ${oriData}    ${outputDataPath}

Duplicate CSV File And Replace Invalid Natid
    [Arguments]    ${duplicateDataPath}     ${outputDataPath}   ${criteria}
    ${natidSyntax}      Set Variable    natid-
    ${natidNoLength}    Set Variable    7
    IF    ${criteria} == 'Syntax'
        ${natidSyntax}      Set Variable    id
    ELSE IF    ${criteria} == 'Length'
        ${natidNoLength}    Set Variable    10
    END
    @{oriData}     Read Csv File To List    ${duplicateDataPath}
    FOR    ${row}   IN  @{oriData}
        ${duplicatedRow}    Set Variable    ${row}
    END
    ${modifiedData}     Create List
    FOR    ${item}  IN  @{duplicatedRow}
        Append To List  ${modifiedData}    ${item}
    END
    ${randomNatid}  Generate Random String    ${natidNoLength}     [NUMBERS]
    Set List Value    ${modifiedData}  ${natid}  ${natidSyntax}${randomNatid}
    ${stringModifiedData}    Convert To String      ${modifiedData}
    ${stringModifiedDataLength}     Get Length      ${stringModifiedData}
    ${stringModifiedDataLength}     Evaluate        ${stringModifiedDataLength} - 1
    ${stringModifiedData}    Get Substring      ${stringModifiedData}    1     ${stringModifiedDataLength}
    ${stringModifiedData}    Remove String      ${stringModifiedData}    '
    ${stringModifiedData}    Remove String      ${stringModifiedData}    ${SPACE}
    Create File  ${outputDataPath}   ${stringModifiedData}