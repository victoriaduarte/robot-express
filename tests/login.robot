*** Settings ***
Documentation        Test scenarios for user login

Resource    ../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Log in with a registered user
    ${user}    Create Dictionary    
    ...    name=Victória Duarte    
    ...    email=victoriaduarte@yahoo.com    
    ...    password=pwd123

    Submit login form    ${user}
    User should be logged in    ${user}

