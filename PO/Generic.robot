*** Settings ***
Documentation    A resource file with reusable keywords and variables

Library    SeleniumLibrary
Library    Collections
Library    String


*** Variables ***
${user_name}               rahulshettyacademy
${invalid_password}        123456789
${valid_password}          learning
${url}                     https://rahulshettyacademy.com/loginpagePractise/
${browser_name}            Chrome




*** Keywords ***
Open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To    ${url}


Open the browser with the url
    Create Webdriver    ${browser_name}
    Maximize Browser Window
    Go To    ${url}


Close Browser session
    Close Browser


Wait Until Element passed is located on Page
    [Arguments]    ${page_locator}
    Wait Until Element Is Visible    ${page_locator}  

