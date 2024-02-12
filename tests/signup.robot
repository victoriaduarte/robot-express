*** Settings ***
Documentation        Test scenarios for user registration

Resource    ../resources/base.robot

Test Teardown    Take Screenshot

*** Test Cases ***    
The system must allow registering a new user 
    ${user}    Create Dictionary    
    ...    name=Victória Duarte    
    ...    email=victoriaduarte@yahoo.com    
    ...    password=pwd123

    Remove user from database    ${user}[email]

    Start Session    signup

    # Checkpoint
    Wait For Elements State    css=h1    visible    5   
    Get Text    css=h1    equal    Faça seu cadastro

    Fill Text    css=#name        ${user}[name]
    Fill Text    css=#email       ${user}[email]
    Fill Text    css=#password    ${user}[password]
    Click    css=#buttonSignup
    
    # Assertion
    Wait For Elements State    .notice p    visible    5
    Get Text    .notice p    equal    Boas vindas ao Mark85, o seu gerenciador de tarefas.


The system must prevent duplicate email registration
    [Tags]    dup

    ${user}    Create Dictionary    
    ...    name=Duarte Victória
    ...    email=duartevictoria@gmail.com 
    ...    password=pwd123
  
    Remove user from database   ${user}[email]
    Insert user in database     ${user}

    Start Session    signup

    # Checkpoint
    Wait For Elements State    css=h1    visible    5   
    Get Text    css=h1    equal    Faça seu cadastro

    Fill Text    css=#name        ${user}[name]
    Fill Text    css=#email       ${user}[email]
    Fill Text    css=#password    ${user}[password]
    Click    css=#buttonSignup
    
    # Assertion
    Wait For Elements State    .notice p    visible    5
    Get Text    .notice p    equal    Oops! Já existe uma conta com o e-mail informado.