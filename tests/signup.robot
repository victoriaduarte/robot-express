*** Settings ***
Documentation        Test scenarios for user registration

Library        Browser
Library        FakerLibrary

Resource    ../resources/base.robot

*** Test Cases ***
The system must allow registering a new user

    # Generate random test data
    ${name}        FakerLibrary.Name
    ${email}       FakerLibrary.Email
    ${password}    Set Variable    pwd123

    Start Session    signup

    # Checkpoint
    Wait For Elements State    css=h1    visible    5   
    Get Text    css=h1    equal    Faça seu cadastro

    Fill Text    css=#name        ${name}
    Fill Text    css=#email       ${email}
    Fill Text    css=#password    ${password}
    Click    css=#buttonSignup
    
    # Assertion
    Wait For Elements State    .notice p    visible    5
    Get Text    .notice p    equal    Boas vindas ao Mark85, o seu gerenciador de tarefas.