*** Settings ***
Library           SeleniumLibrary
Library           String
Library           DateTime
Resource          ../variables/medusa_variables.robot

*** Keywords ***
Open Browser With Security Bypass
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    
    # Add arguments to suppress errors
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --silent
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --ignore-ssl-errors

    # Optional: Add these if you want to run tests without opening browser window
    # Call Method    ${chrome_options}    add_argument    --headless
    
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${URL}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${TIMEOUT}

Navigate To Account Page
    Click Element    ${ACCOUNT_LINK}
    Wait Until Element Is Visible    ${LOGIN_EMAIL}    timeout=${TIMEOUT}