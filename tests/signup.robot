*** Settings ***
Documentation        Test scenarios for user registration

Resource    ../resources/base.resource
Resource    ../resources/pages/SignupPage.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***    
The system must allow registering a new user 
    ${user}    Create Dictionary    
    ...    name=Victória Duarte    
    ...    email=victoriaduarte@yahoo.com    
    ...    password=pwd123

    Remove user from database    ${user}[email]

    Go to signup page
    Submit signup form    ${user}
    Notice should be    Boas vindas ao Mark85, o seu gerenciador de tarefas.

The system must prevent duplicate email registration
    [Tags]    dup

    ${user}    Create Dictionary    
    ...    name=Duarte Victória
    ...    email=duartevictoria@gmail.com 
    ...    password=pwd123
  
    Remove user from database   ${user}[email]
    Insert user in database     ${user}

    Go to signup page
    Submit signup form    ${user}
    Notice should be    Oops! Já existe uma conta com o e-mail informado.
