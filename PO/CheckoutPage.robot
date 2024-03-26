*** Settings ***
Documentation   All the page objects and keywords of Landing Page

Library    SeleniumLibrary
Library    Collections
Library    String

*** Variables ***
${CheckoutButton}    css:.btn-success


*** Keywords ***
Verify items in the checkout page and proceed
    Page Should Contain    Blackberry
    Page Should Contain    Nokia Edge
    Click Button           ${CheckoutButton}