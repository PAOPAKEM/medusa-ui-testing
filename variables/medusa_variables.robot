*** Variables ***
# URLs & Browser Config
${URL}                      http://45.136.236.146
${BROWSER}                  chrome
${TIMEOUT}                  20s

# Navigation Elements
${ACCOUNT_LINK}            css=a[data-testid="nav-account-link"]

# Login Page Elements
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
${LOGIN_ERROR}             Error: Wrong email or password.

# Test Data
&{LOGIN_USER}              email=test@example.com    password=password123