*** Settings ***
Documentation     Suite Browser Setup
Library           QWeb
Resource    ../resources/keywords.robot

# Login to CRT at the start
Suite Setup        Run Keywords    
...                OpenBrowser    about:blank    chrome    
...                AND    Login to CRT

Suite Teardown    CloseAllBrowsers
