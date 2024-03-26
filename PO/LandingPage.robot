*** Settings ***
Documentation   All the page objects and keywords of Landing Page

#Library    SeleniumLibrary
#Library    Collections
Library    String
Resource    Generic.robot


*** Variables ***
${Error_Message_Login}        css:.alert-danger


*** Keywords ***
Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      id:signInBtn


Wait until Element is located on the page
    Wait Until Element passed is located on Page    ${Error_Message_Login}


Verify error message is correct
    ${result} =     Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.


Fill the Login Details and select the User Option
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    learning
    Click Element    css:input[value='user']
    Wait Until Element Is Visible    id:okayBtn
    Click Button    id:okayBtn
    Sleep    6
    Wait Until Element Is Not Visible    id:okayBtn
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    id:terms
    Checkbox Should Be Selected    id:terms
#    Unselect Checkbox    id:terms