*** Settings ***
Library    Collections
Library    RequestsLibrary


*** Variables ***
${base_url}    https://rahulshettyacademy.com
${book_id}
${book_name}        Mathematics

*** Test Cases ***
Play around with Dictionary
    [Tags]    API
    &{Data}=    Create Dictionary    name=Shrek    course=School    website=https://rahulshettyacademy.com/
    log    ${Data}
    Dictionary Should Contain Key    ${Data}       name
    log    ${Data}[name]
    ${url}=    Get From Dictionary    ${Data}    website
    Log    ${url}


Add Book into Library Database
    [Tags]    API
    &{book}=    Create Dictionary    name=${book_name}    isbn=398956    aisle=342153    author=JambaShreks
    ${response}=    POST    ${base_url}/Library/Addbook.php    json=${book}    expected_status=200
    log    ${response.json()}
    Dictionary Should Contain Key    ${response.json()}    ID
    ${book_id}=    Get From Dictionary    ${response.json()}    ID
    Set Global Variable    ${book_id}
    Log    ${book_id}
    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]


Get the Book Details which got added
    [Tags]    API
   ${get_response}=    GET    ${base_url}/Library/GetBook.php    params=ID=${book_id}    expected_status=200
    log    ${get_response.json()}
    Should Be Equal As Strings    Mathematics    ${get_response.json()}[0][book_name]


Delete the Book from the Database
    [Tags]    API
    &{delete_book}=    Create Dictionary    ID=${book_id}
    ${delete_response}=    POST    ${base_url}/Library/DeleteBook.php    json=${delete_book}    expected_status=200
    log    ${delete_response.json()}
    Should Be Equal As Strings    book is successfully deleted    ${delete_response.json()}[msg]