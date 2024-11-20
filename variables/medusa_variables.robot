*** Variables ***
# URLs
${URL}                  http://45.136.236.146
${LOGIN_URL}            ${URL}/account/login
${CART_URL}                 ${URL}/cart
${BROWSER}              chrome
${TIMEOUT}              20s

# Header Elements
${MENU_BUTTON}             css=button[data-testid="nav-menu-button"]
${STORE_LINK}              css=a[data-testid="nav-store-link"]
${ACCOUNT_LINK}            css=a[data-testid="nav-account-link"]
${CART_LINK}               css=a[data-testid="nav-cart-link"]

# Product List Elements
${PRODUCT_WRAPPER}      css=div[data-testid="product-wrapper"]
${PRODUCT_TITLE}        css=p[data-testid="product-title"]
${PRODUCT_PRICE}        css=p[data-testid="price"]
${PRODUCT_IMAGE}        css=img[alt="Thumbnail"]

# Product Detail Elements
${ADD_TO_CART_BUTTON}   css=button[data-testid="add-product-button"]
${PRODUCT_DESC}         css=p[data-testid="product-description"]
${PRODUCT_INFO_BTN}     css=button[aria-controls="radix-:r4:"]
${SHIPPING_INFO_BTN}    css=button[aria-controls="radix-:r6:"]

# Collection Elements
${COLLECTION_LINK}      css=a[href="/collections/merch"]
${VIEW_ALL_LINK}        css=a[href="/collections/merch"]

# Specific Product URLs
${COFFEE_MUG_URL}       ${URL}/products/coffee-mug
${HOODIE_URL}           ${URL}/products/hoodie
${LONGSLEEVE_URL}       ${URL}/products/longsleeve

# Product Data
&{COFFEE_MUG}           name=Medusa Coffee Mug    price=$12.00    desc=Every programmer's best friend.
&{HOODIE}              name=Medusa Hoodie       price=$41.50
&{LONGSLEEVE}          name=Medusa Longsleeve   price=$41.50

# Login Page Elements
${EMAIL_INPUT}              css=input[data-testid="email-input"]
${PASSWORD_INPUT}           css=input[data-testid="password-input"]
${SIGNIN_BUTTON}            css=button[data-testid="sign-in-button"]
${REGISTER_BUTTON}          css=button[data-testid="register-button"]
${LOGIN_ERROR_MESSAGE}      css=div[class*="alert-error"]

# Account Elements
${ACCOUNT_HEADER}          css=h1[class*="text-large-semi"]

# Test Data
${VALID_EMAIL}             test@example.com
${VALID_PASSWORD}          password123
${INVALID_EMAIL}           invalid@example.com
${INVALID_PASSWORD}        wrongpassword

# Cart Page Elements
${CART_CONTAINER}          css=div[data-testid="cart-container"]
${PRODUCT_ROW}             css=tr[data-testid="product-row"]
${PRODUCT_TITLE}           css=p[data-testid="product-title"]
${PRODUCT_VARIANT}         css=p[data-testid="product-variant"]
${PRODUCT_QUANTITY}        css=select[data-testid="product-select-button"]
${PRODUCT_UNIT_PRICE}      css=span[data-testid="product-unit-price"]
${PRODUCT_PRICE}           css=span[data-testid="product-price"]
${REMOVE_PRODUCT}          css=button.flex.gap-x-1

# Cart Summary Elements
${CART_SUBTOTAL}           css=span[data-testid="cart-subtotal"]
${CART_SHIPPING}           css=span[data-testid="cart-shipping"]
${CART_TAXES}              css=span[data-testid="cart-taxes"]
${CART_TOTAL}              css=span[data-testid="cart-total"]
${CHECKOUT_BUTTON}         css=a[data-testid="checkout-button"]
${ADD_DISCOUNT_BUTTON}     css=button[data-testid="add-discount-button"]

# Product Data
&{COFFEE_MUG}              name=Medusa Coffee Mug    variant=One Size    price=$12.00
&{LONGSLEEVE}             name=Medusa Longsleeve   variant=S           price=$41.50

# Messages
${EMPTY_CART_MSG}         Your shopping cart is empty.
${ADDED_TO_CART_MSG}      Item added to cart