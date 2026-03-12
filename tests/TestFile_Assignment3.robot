*** Settings ***
Resource    ../resources/keywords.robot
Documentation           Make an end to end test that uses the explorer
Library                 QWeb 

*** Variables ***
# Names
${EXPLORATION_NAME}    Webshop Exploration
# Locators
${3_BUTTONS_ICON}    xpath=//div[@id='exploration-menu']//button
${SUPPORT_TAB}    ${CURDIR}/images/support_tab2.png
${TEXT_ANNOTATE_BUTTON}    xpath\=//button[.//cds-icon[@shape='OfficeAndEditingTextAa']]
*** Test Cases ***
Navigate to Explorer
    VerifyText    Copado Explorer    timeout=10s
    ClickText     Copado Explorer
    ClickText     New Exploration
Launch an Explorer session for Webshop
    [Documentation]    Type in the title for the exploration and click start
    TypeText    explorationName    ${EXPLORATION_NAME}
    ClickText   Additional Settings
    TypeText    urlInput           https://qentinelqi.github.io/shop/    timeout=10s
    VerifyText  Start Exploring    timeout=10s
    ClickText   Start Exploring
Explore the page
    [Documentation]    Click Add annotation and the Aa icon to put text annotation, then save  
    MaximizeWindow
    # Go to sidebar
    VerifyText         Add Finding
    ClickText          Add Finding
    ClickElement       ${TEXT_ANNOTATE_BUTTON}
    ClickText    Save
Ensure steps are recorded and end exploration
    [Documentation]    Open the side panel with the steps and verify steps added
    ClickText          Steps    
    VerifyText    Added Finding    timeout=5s
    ClickItem    endExploration    anchor=End Exploration    timeout=20s
    ClickText    Yes, End          timeout=10s
Verify the Exploration Summary page
     [Documentation]    Check there are test steps and recorded findings
     VerifyText         Test Steps Performed: 1    timeout=10s
     VerifyText         Findings: 1                timeout=10s
Export the Exploration
    ClickElement    ${3_BUTTONS_ICON}
    ClickText       Export...
    ClickText       Export
    VerifyText      Document export has been queued    timeout=10s
Download the video
    ClickElement    ${3_BUTTONS_ICON}
    ClickText       Download Video
    VerifyText      Initiating exploration video download    timeout=10s
Delete the Explorer session that was created
    ClickElement    ${3_BUTTONS_ICON}
    ClickText    Delete Exploration    timeout=10s
    TypeText     confirmationText      delete    timeout=10s
    ClickText    Delete                timeout=10s                
Verify that the session was deleted
    VerifyNoText    ${EXPLORATION_NAME}    timeout=10s
