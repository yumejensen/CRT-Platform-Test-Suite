*** Settings ***
Documentation           Keywords
Library                 QWeb 

*** Keywords ***
Login to CRT
    GoTo    ${CRT_LOGIN_URL}
    ClickText     Sign in with email →
    TypeText      Email    ${CRT_USER}
    TypeText      Password    ${CRT_PASS}
    ClickText     LOGIN
