*** Settings ***
Documentation   All the page objects and keywords of Landing Page

#Library    SeleniumLibrary
#Library    Collections
Library    String

*** Variables ***
${Shop_page_load}             css:.nav-link


*** Keywords ***
Wait until Element is located on the page
    Wait Until Element passed is located on Page    ${Shop_page_load}


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