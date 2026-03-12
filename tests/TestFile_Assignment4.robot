*** Settings ***

Documentation           New test suite
Library                 QWeb 

*** Variables ***
#
# Locators
${OKTA_USERNAME_FIELD}        xpath=//input[@id='okta-signin-username']
${OKTA_PASSWORD_FIELD}        xpath=//input[@id='okta-signin-password']
${Email_Line}           xpath=//div[@aria-label='Main menu']

*** Test Cases ***
Login To GMAIL
    GoTo        ${EMAIL_LOGIN_URL}
    ClickText         Email or phone
	TypeText          identifier                        ${EMAIL_USER}\n
    ClickElement      ${OKTA_USERNAME_FIELD}               
	TypeText          ${OKTA_USERNAME_FIELD}                  ${EMAIL_USER}
    ClickElement      ${OKTA_PASSWORD_FIELD}  
	TypeSecret        ${OKTA_PASSWORD_FIELD}                  ${EMAIL_PASS}
    ClickText         Sign In
    ClickText         Send Push                         timeout=10s
    Sleep             10s
    VerifyText        Verify                            timeout=10s
    ClickText         Continue                          
Send Email
    # 1. Check if Compose is visible; if not, expand the menu
    ${is_visible}=      IsText          Compose         timeout=2s
    Run Keyword If      '${is_visible}' == 'False'      ClickElement    ${Email_Line}
    
    # 2. Proceed with clicking Compose
    VerifyText          Compose         timeout=10s
    ClickText           Compose
    
    # 3. Fill and Send
    TypeText            To                              ${EMAIL_USER}
    TypeText            Subject                         CRT Automation Test
    # Clicking the message body area to focus before typing
    ClickText           Help me write
    TypeText            Message Body                    This is an automated test from Copado Robotic Testing.
    ClickText           Send
