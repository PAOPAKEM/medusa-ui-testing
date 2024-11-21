*** Variables ***
# URLs & Browser Config
${URL}                      http://45.136.236.146
${BROWSER}                  chrome
${TIMEOUT}                  20s

# Navigation Elements
${MENU_BUTTON}             css=button[data-testid="nav-menu-button"]
${ACCOUNT_LINK}            css=a[data-testid="nav-account-link"]

# Login Page Elements
${LOGIN_HEADER}            Sign in
${LOGIN_EMAIL}             css=input[data-testid="email-input"]
${LOGIN_PASSWORD}          css=input[data-testid="password-input"]
${LOGIN_BUTTON}            css=button[data-testid="sign-in-button"]

# Registration Page Elements
${REGISTER_LINK}           css=button[data-testid="register-button"]
${REGISTER_HEADER}         Become a Medusa Store Member
${FIRST_NAME_INPUT}        css=input[data-testid="first-name-input"]
${LAST_NAME_INPUT}         css=input[data-testid="last-name-input"]
${EMAIL_INPUT}             css=input[data-testid="email-input"]
${PHONE_INPUT}             css=input[data-testid="phone-input"]
${PASSWORD_INPUT}          css=input[data-testid="password-input"]
${JOIN_BUTTON}             css=button[data-testid="register-button"]

# Messages
${SUCCESS_MSG}             Profile created successfully
${LOGIN_ERROR}             Error: Wrong email or password.
${EMAIL_EXISTS_ERROR}      Error: A customer with the given email already has an account. Log in instead.

# Test Data
&{VALID_USER}              first_name=Jane    last_name=Doe    email=jane.doe@test.com    phone=1234567890    password=Test123!@#
&{INVALID_USER}            first_name=${EMPTY}    last_name=${EMPTY}    email=invalid.email    phone=${EMPTY}    password=123
&{LOGIN_USER}              email=test@example.com    password=password123

${EMAIL_PREFIX}         test.user
${EMAIL_DOMAIN}        example.com
${NAME_PREFIX}         Test

${RETRY_COUNT}    3
${RETRY_INTERVAL}    2s