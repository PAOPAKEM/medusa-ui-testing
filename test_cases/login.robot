*** Settings ***
Resource          ../resources/common.robot
Resource          ../resources/medusa_keywords.robot
Test Setup        Open Browser With Security Bypass
Test Teardown     Close Browser
Documentation     Test login and registration functionality

*** Test Cases ***
# Login Test Cases
Valid Login Test
    [Documentation]    Test login with valid credentials
    [Tags]    login    positive
    Navigate To Account Page
    Login User    ${LOGIN_USER.email}    ${LOGIN_USER.password}
    Verify Login Success

Invalid Login Test
    [Documentation]    Test login with invalid credentials
    [Tags]    login    negative
    Navigate To Account Page
    Login User    invalid@email.com    wrongpassword
    Verify Login Error

Empty Login Test
    [Documentation]    Test login with empty credentials
    [Tags]    login    negative
    Navigate To Account Page
    Login User    ${EMPTY}    ${EMPTY}
    Page Should Contain Element    css=input:invalid

# Registration Test Cases
Valid Registration Test
    [Documentation]    Test registration with valid data
    [Tags]    register    positive
    Navigate To Account Page
    Navigate To Register Page
    ${user_data}=    Register New User
    Submit Registration
    Verify Login Success

# Registration With Missing Required Fields
#     [Documentation]    Test registration validation for required fields
#     [Tags]    register    negative
#     Navigate To Account Page
#     Navigate To Register Page
#     Fill Registration Form    
#     ...    ${EMPTY}    
#     ...    ${EMPTY}    
#     ...    ${EMPTY}    
#     ...    ${EMPTY}    
#     ...    ${EMPTY}
#     Submit Registration
#     Verify Required Fields    ${FIRST_NAME_INPUT}
#     Verify Required Fields    ${LAST_NAME_INPUT}
#     Verify Required Fields    ${EMAIL_INPUT}
#     Verify Required Fields    ${PASSWORD_INPUT}

# Registration With Invalid Email
#     [Documentation]    Test registration with invalid email format
#     [Tags]    register    negative
#     Navigate To Account Page
#     Navigate To Register Page
#     Fill Registration Form    
#     ...    ${VALID_USER.first_name}    
#     ...    ${VALID_USER.last_name}    
#     ...    invalid.email    
#     ...    ${VALID_USER.phone}    
#     ...    ${VALID_USER.password}
#     Submit Registration
#     Page Should Contain Element    css=input:invalid

# Registration With Optional Phone
#     [Documentation]    Test registration without phone number
#     [Tags]    register    positive
#     Navigate To Account Page
#     Navigate To Register Page
#     Fill Registration Form    
#     ...    ${VALID_USER.first_name}    
#     ...    ${VALID_USER.last_name}    
#     ...    ${VALID_USER.email}    
#     ...    ${EMPTY}    
#     ...    ${VALID_USER.password}
#     Submit Registration
#     Wait Until Page Contains    ${SUCCESS_MSG}