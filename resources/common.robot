*** Settings ***
Library           SeleniumLibrary
Resource          ../variables/medusa_variables.robot

*** Keywords ***
Open Browser With Security Bypass
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --ignore-ssl-errors

    # these arguments to suppress the errors
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --silent

    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${URL}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${TIMEOUT}

Wait For Page Load
    Wait Until Element Is Visible    ${MENU_BUTTON}
    Wait Until Element Is Visible    ${STORE_LINK}

Navigate To Home
    Go To    ${URL}
    Wait For Page Load

Navigate To Product
    [Arguments]    ${product_url}
    Go To    ${product_url}
    Wait Until Element Is Visible    ${PRODUCT_TITLE}

Navigate To Login Page
    Click Element    ${ACCOUNT_LINK}
    Wait Until Element Is Visible    ${EMAIL_INPUT}
    Wait Until Element Is Visible    ${PASSWORD_INPUT}

Navigate To Cart
    Click Element    ${CART_LINK}
    Wait Until Element Is Visible    ${CART_CONTAINER}

Verify Empty Cart
    Page Should Contain    ${EMPTY_CART_MSG}

Wait For Cart Update
    Sleep    1s    # Wait for cart to update