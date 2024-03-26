*** Settings ***
Documentation   All the page objects and keywords of Landing Page

Library    SeleniumLibrary
Library    Collections
Library    String

*** Variables ***
${Shop_page_load}             css:.nav-link
${country_location}           xpath://a[text()='India']


*** Keywords ***

Enter the Country and select The Terms
    [Arguments]    ${country_name}
    Wait Until Element passed is located on Page   id:country
    Input Text     id:country    ${country_name}
    Sleep    6
    Wait Until Element passed is located on Page    xpath://a[text()='${country_name}']
    Click Element    xpath://a[text()='${country_name}']
    Click Element    css:.checkbox-primary label
    
    
Purchase the Product and Confirm the Purchase
    Click Button    css:.btn-success
    Page Should Contain    Success!
