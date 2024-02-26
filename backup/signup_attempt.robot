*** Settings ***
Documentation        Test scenarios for attempt user registration with short passwords
Resource    ../resources/base.resource
Test Template    Short password

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
The system must prevent registering password with 1 character    1
The system must prevent registering password with 2 characters    12
The system must prevent registering password with 3 characters    123
The system must prevent registering password with 4 characters    1234
The system must prevent registering password with 5 characters    12345

*** Keywords ***
Short password
    [Arguments]    ${short_pass}
    ${user}    Create Dictionary    
    ...    name=Duarte Victória
    ...    email=duartevictoria@outlook.com 
    ...    password=${short_pass}

    Go to signup page
    Submit signup form    ${user}

    Alert should be    Informe uma senha com pelo menos 6 digitos