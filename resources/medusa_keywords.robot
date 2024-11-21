*** Settings ***
Library           SeleniumLibrary
Resource          common.robot

*** Keywords ***
# Login Keywords
Login User
    [Arguments]    ${email}    ${password}
    Input Text    ${LOGIN_EMAIL}    ${email}
    Input Text    ${LOGIN_PASSWORD}    ${password}
    Click Element    ${LOGIN_BUTTON}

Verify Login Success
    Wait Until Page Contains    Signed in as:    timeout=${TIMEOUT}

Verify Login Error
    Wait Until Page Contains    ${LOGIN_ERROR}    timeout=${TIMEOUT}
    Page Should Contain    ${LOGIN_ERROR}

# Registration Keywords
Navigate To Register Page
    Click Element    ${REGISTER_LINK}
    Wait Until Page Contains    ${REGISTER_HEADER}

Fill Registration Form
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${phone}    ${password}
    Input Text    ${FIRST_NAME_INPUT}    ${first_name}
    Input Text    ${LAST_NAME_INPUT}    ${last_name}
    Input Text    ${EMAIL_INPUT}    ${email}
    Run Keyword If    '${phone}' != '${EMPTY}'    Input Text    ${PHONE_INPUT}    ${phone}
    Input Text    ${PASSWORD_INPUT}    ${password}

Submit Registration
    Click Element    ${JOIN_BUTTON}

Generate Random Email
    ${random_string}=    Generate Random String    8    [LETTERS][NUMBERS]
    ${timestamp}=    Get Current Date    result_format=%H%M%S
    ${email}=    Set Variable    test.${random_string}.${timestamp}@example.com
    RETURN    ${email}

Generate Random User Data
    ${random_email}=    Generate Random Email
    ${random_string}=    Generate Random String    4    [LETTERS]
    ${user_data}=    Create Dictionary
    ...    first_name=Test${random_string}
    ...    last_name=User${random_string}
    ...    email=${random_email}
    ...    phone=1234567890
    ...    password=Test123!@#
    RETURN    ${user_data}

Register New User
    ${user_data}=    Generate Random User Data
    Fill Registration Form
    ...    ${user_data}[first_name]
    ...    ${user_data}[last_name]
    ...    ${user_data}[email]
    ...    ${user_data}[phone]
    ...    ${user_data}[password]
    Submit Registration
    RETURN    ${user_data}