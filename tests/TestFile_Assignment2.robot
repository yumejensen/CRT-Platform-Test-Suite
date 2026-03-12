*** Settings ***

Documentation    Test that video streaming started
Resource    ../resources/keywords.robot
Library                 QWeb

*** Variables ***
# Names
${PROJECT_NAME}    Medaly - Test project 02/24/2026
# Locators
${PROJECT_DROPDOWN}    xpath\=//button[.//div[contains(@class, 'org-info')]]
${DISABLED_SAVE_BTN}    xpath\=//button[text()='Save' and @disabled]
${MOST_RECENT_TEST_RUN}    xpath\=//*[text()='Run ID']/following::a[contains(@class, 'btn-link')][1]
*** Test Cases ***
Enable video streaming for a test run of a test suite
    Login to CRT
    ClickText    ${PROJECT_DROPDOWN}
    ClickText    ${PROJECT_NAME}
    ClickText    Test Runs
    # Click on the most recent test run
    ClickElement     ${MOST_RECENT_TEST_RUN}
    ClickText    Configuration
    ClickText    Enabled    anchor=Video Streaming and Recording
    # Click the save button if it is not disabled - it's disabled when a setting doesn't change
    ${IS_DISABLED}    IsElement    ${DISABLED_SAVE_BTN}    timeout=2s
    IF                      not $IS_DISABLED
        ClickText                       Save
    END
    ClickText    Cancel     
Run the test
    ClickText    Re-Run
    ClickText    Open Video Stream
    ClickText    Run Now
Verify that the video streaming actually starts
    # Verify the browser area is interactive
    # List all open windows to verify a new one opened
    Sleep    2s
    ${all_windows}=     ListWindows
    Log                 All open windows: ${all_windows}
    # Switch to the new window
    SwitchWindow    NEW
    # Verify the pop-up window opened by checking its title
    VerifyTitle         Video Stream · Copado Robotic Testing   timeout=15s
    UseFrame            //iframe
    VerifyNoText        Please wait while the video stream is being created    timeout=40s
