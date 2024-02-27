*** Settings ***
Documentation        Test scenarios for user login

Resource    ../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot
Library    Collections

*** Test Cases ***
Log in with a registered user
    ${user}    Create Dictionary    
    ...    name=Victória Duarte    
    ...    email=victoriaduarte@yahoo.com    
    ...    password=pwd123 

    Remove user from database    ${user}[email]
    Insert user in database      ${user}

    Submit login form    ${user}
    User should be logged in    ${user}

Should not login with invalid password
    ${user}    Create Dictionary    
    ...    name=Uchiha Itachi
    ...    email=itachi@gmail.com    
    ...    password=123456 

    Remove user from database    ${user}[email]
    Insert user in database      ${user}

    Set To Dictionary    ${user}    password=abc123

    Submit login form    ${user}
    Notice should be     Ocorreu um erro ao fazer login, verifique suas credenciais.
