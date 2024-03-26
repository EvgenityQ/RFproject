*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Setup       Open the browser with the Mortgage payment url
Test Teardown    Close Browser
Resource         ../PO/Generic.robot

*** Variables ***
${Error_Message_Login}        css:.alert-danger


*** Test Cases ***
Validate Child window Functionality
    [Tags]    SMOKE
    Select the Link of Child Window
    Verify the user is switched to Child Window
    Grab the Email ID in the Child Window
    Switch to Parent Window and enter the Email


*** Keywords ***
Select the Link of Child Window
    Click Element        css:.blinkingText
    Sleep                5


Verify the user is switched to Child Window
    Switch Window        NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST


Grab the Email ID in the Child Window
    ${text}=     Get Text    css:.red
    @{words}=    Split String    ${text}    at
    ${text_split}=    Get From List    ${words}    1
    Log   ${text_split}
    @{words_2}=    Split String    ${text_split}
    ${email}=    Get From List    ${words_2}    0
    Set Global Variable    ${email}


Switch to Parent Window and enter the Email
    Switch Window      MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text         id:username    ${email}
    Sleep    5


    





    