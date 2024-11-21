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