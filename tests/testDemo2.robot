*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
Test Setup       Open the browser with the Mortgage payment url
Test Teardown    Close Browser
Resource         ../PO/Generic.robot

*** Variables ***
${Error_Message_Login}        css:.alert-danger
${Shop_page_load}             css:.nav-link


*** Test Cases ***
Validate UnSuccessful Login

    Fill the login Form    ${user_name}        ${invalid_password}
    Wait until Element is located on the page    ${Error_Message_Login}
    Verify error message is correct


Validate Cards display on the Shopping Page
    [Tags]    REGRESSION    SMOKE
    Fill The Login Form    ${user_name}        ${valid_password}
    Wait until Element is located on the page    ${Shop_page_load}
    Verify Card titles on the Shop page
    Select the Card    iphone X


Select the Form and navigate to Child window
    [Tags]    NFT
    FIll the Login Details and select the User Option



*** Keywords ***
Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      id:signInBtn


Wait until Element is located on the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}


Verify error message is correct
    ${result} =     Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.


Verify Card titles on the Shop page
   @{expected_list} =   Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
   ${elements} =        Get Webelements    css:.card-title
   @{actual_list} =     Create List    
   
   FOR    ${element}    IN    @{elements}
       Log  ${element.text}
       Append To List    ${actual_list}    ${element.text}
   END
    Lists Should Be Equal    ${expected_list}    ${actual_list}


Select the Card
    [Arguments]    ${card_name}
    ${elements} =        Get Webelements    css:.card-title
    ${index} =    Set Variable    1
     FOR    ${element}    IN    @{elements}
          Exit For Loop If    '${card_name}' == '${element.text}'
          ${index}=    Evaluate    ${index} + 1
     END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button


FIll the Login Details and select the User Option
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    learning
    Click Element    css:input[value='user']
    Wait Until Element Is Visible    id:okayBtn
    Click Button    id:okayBtn
    Wait Until Element Is Not Visible    id:okayBtn
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    id:terms
    Checkbox Should Be Selected    id:terms
#    Unselect Checkbox    id:terms
