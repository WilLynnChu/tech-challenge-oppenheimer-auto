*** Settings ***
Documentation    Generic keyword file
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}                         http://localhost:9997
${PROJ_DIR}                         .
${execution_profile_chrome_name}    Chrome
${execution_profile_chrome_path}    executable_path=./drivers/chromedriver/chromedriver

*** Keywords ***
Open Browser And Navigate To URL
    Create Webdriver        ${execution_profile_chrome_name}    ${execution_profile_chrome_path}
    Go To                   ${BASE_URL}/login