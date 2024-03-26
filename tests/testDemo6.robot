*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
Library    ../customLibraries/Shop.py
Test Setup       Open the browser with the url
Test Teardown    Close Browser
Suite Setup
Resource         ../PO/Generic.robot
Resource         ../PO/LandingPage.robot
Resource         ../PO/ShopPage.robot
Resource         ../PO/CheckoutPage.robot
Resource         ../PO/ConfirmationPage.robot


*** Variables ***
@{listofProducts}             Blackberry    Nokia Edge
${country_name}               India


*** Test Cases ***
Validate UnSuccessful Login
    [Tags]    SMOKE
    LandingPage.Fill The Login Form    ${user_name}        ${invalid_password}
    LandingPage.Wait until Element is located on the page
    LandingPage.Verify error message is correct


Validate Cards display on the Shopping Page
    [Tags]    SMOKE
    LandingPage.Fill The Login Form    ${user_name}        ${valid_password}
    ShopPage.Wait until Element is located on the page
    ShopPage.Verify Card titles on the Shop page
    Add Items To Cart And Checkout    ${listofProducts}
    CheckoutPage.Verify items in the checkout page and proceed
    ConfirmationPage.Enter the Country and select The Terms     ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase
#    Select the Card    iphone X


Select the Form and navigate to Child window
    [Tags]    REGRESSION
    LandingPage.Fill the Login Details and select the User Option


