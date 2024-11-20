*** Settings ***
Library           SeleniumLibrary
Resource          common.robot

*** Keywords ***
Add Product To Cart From Home
    [Arguments]    ${product_name}
    Wait Until Element Is Visible    ${PRODUCT_WRAPPER}
    Click Element    xpath=//p[@data-testid="product-title" and contains(text(),'${product_name}')]
    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON}
    Click Element    ${ADD_TO_CART_BUTTON}
    Wait Until Element Contains    ${CART_LINK}    (1)

Add Product To Cart From Detail
    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON}
    Click Element    ${ADD_TO_CART_BUTTON}
    Wait Until Element Contains    ${CART_LINK}    (1)

Verify Product Price
    [Arguments]    ${expected_price}
    ${price_text}=    Get Text    ${PRODUCT_PRICE}
    Should Be Equal    ${price_text}    ${expected_price}

Verify Product Description
    [Arguments]    ${expected_desc}
    ${desc_text}=    Get Text    ${PRODUCT_DESC}
    Should Be Equal    ${desc_text}    ${expected_desc}

Open Product Information
    Click Element    ${PRODUCT_INFO_BTN}
    Wait Until Element Is Visible    id=radix-:r4:

Open Shipping Information
    Click Element    ${SHIPPING_INFO_BTN}
    Wait Until Element Is Visible    id=radix-:r6:

View Cart
    Click Element    ${CART_LINK}
    Wait Until Page Contains    Shopping Cart

Input Login Credentials
    [Arguments]    ${email}    ${password}
    Clear Element Text    ${EMAIL_INPUT}
    Input Text    ${EMAIL_INPUT}    ${email}
    Clear Element Text    ${PASSWORD_INPUT}
    Input Text    ${PASSWORD_INPUT}    ${password}

Submit Login Form
    Click Element    ${SIGNIN_BUTTON}

Verify Login Success
    Wait Until Page Contains    Welcome back
    Page Should Contain Element    ${ACCOUNT_HEADER}

Verify Login Error
    [Arguments]    ${expected_error}
    Wait Until Page Contains    ${expected_error}
    Page Should Contain    ${expected_error}

Switch To Register Form
    Click Element    ${REGISTER_BUTTON}
    Wait Until Page Contains    Become a Medusa

Add Product To Cart
    [Arguments]    ${product_name}    ${variant}=None
    Click Element    xpath=//p[contains(text(),'${product_name}')]//ancestor::a
    Wait Until Element Is Visible    css=button[data-testid="add-product-button"]
    Run Keyword If    '${variant}' != 'None'    Select Product Variant    ${variant}
    Click Element    css=button[data-testid="add-product-button"]
    Wait Until Element Contains    ${CART_LINK}    Cart (1)

Select Product Variant
    [Arguments]    ${variant}
    Wait Until Element Is Visible    css=select
    Select From List By Label    css=select    ${variant}

Update Product Quantity
    [Arguments]    ${product_name}    ${quantity}
    ${row}=    Get Product Row    ${product_name}
    Select From List By Value    ${row}//${PRODUCT_QUANTITY}    ${quantity}
    Wait For Cart Update

Remove Product From Cart
    [Arguments]    ${product_name}
    ${row}=    Get Product Row    ${product_name}
    Click Element    ${row}//${REMOVE_PRODUCT}
    Wait For Cart Update

Get Product Row
    [Arguments]    ${product_name}
    ${row}=    Get WebElement    xpath=//p[contains(text(),'${product_name}')]//ancestor::tr
    RETURN    ${row}

Verify Product In Cart
    [Arguments]    ${product_name}    ${variant}    ${price}
    Wait Until Page Contains    ${product_name}
    Page Should Contain    ${variant}
    Page Should Contain    ${price}

Verify Cart Total
    [Arguments]    ${expected_total}
    ${total}=    Get Text    ${CART_TOTAL}
    Should Be Equal    ${total}    ${expected_total}

Apply Discount Code
    [Arguments]    ${code}
    Click Element    ${ADD_DISCOUNT_BUTTON}
    Input Text    css=input[placeholder="Code"]    ${code}
    Click Element    css=button[type="submit"]
    Wait For Cart Update

Proceed To Checkout
    Click Element    ${CHECKOUT_BUTTON}
    Wait Until Location Contains    /checkout