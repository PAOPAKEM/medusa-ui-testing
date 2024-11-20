*** Settings ***
Resource          ../resources/common.robot
Resource          ../resources/medusa_keywords.robot
Test Setup        Open Browser With Security Bypass
Test Teardown     Close Browser
Documentation     Test login functionality

*** Test Cases ***
Valid Login Test
    [Documentation]    Test login with valid credentials
    [Tags]    login    smoke
    Navigate To Login Page
    Input Login Credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Submit Login Form
    Verify Login Success

Invalid Email Login Test
    [Documentation]    Test login with invalid email
    [Tags]    login    negative
    Navigate To Login Page
    Input Login Credentials    ${INVALID_EMAIL}    ${VALID_PASSWORD}
    Submit Login Form
    Verify Login Error    Error: Wrong email or password

Invalid Password Login Test
    [Documentation]    Test login with invalid password
    [Tags]    login    negative
    Navigate To Login Page
    Input Login Credentials    ${VALID_EMAIL}    ${INVALID_PASSWORD}
    Submit Login Form
    Verify Login Error    Error: Wrong email or password

Switch To Registration Test
    [Documentation]    Test switching to registration form
    [Tags]    login    registration
    Navigate To Login Page
    Switch To Register Form
    Page Should Contain   Create your Medusa Store Member

