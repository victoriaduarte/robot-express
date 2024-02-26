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

Required fields
    [Tags]    required
    ${user}    Create Dictionary    
    ...    name=${EMPTY}
    ...    email=${EMPTY}
    ...    password=${EMPTY}

    Go to signup page
    Submit signup form    ${user}
    Alert should be    Informe seu nome completo
    Alert should be    Informe seu e-email
    Alert should be    Informe uma senha com pelo menos 6 digitos

The system must prevent registering invalid email
    [Tags]    invalid

    ${user}    Create Dictionary    
    ...    name=Fulana da Silva
    ...    email=fulana.com.br
    ...    password=123456

    Go to signup page
    Submit signup form    ${user}
    Alert should be    Digite um e-mail válido