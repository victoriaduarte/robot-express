*** Settings ***
Documentation    Elements and actions in signup page

Library    Browser
Resource    ../env.robot

*** Keywords ***
Go to signup page
    Go To    ${BASE_URL}/signup

    # Checkpoint
    Wait For Elements State    css=h1    visible    5   
    Get Text    css=h1    equal    Faça seu cadastro

Submit signup form
    [Arguments]    ${user}
    Fill Text    css=#name        ${user}[name]
    Fill Text    css=#email       ${user}[email]
    Fill Text    css=#password    ${user}[password]
    Click    css=#buttonSignup

Notice should be
    [Arguments]    ${expected_text}

    ${element}    Set Variable    css=.notice p
    
    # Assertion
    Wait For Elements State    ${element}    visible    5
    Get Text                   ${element}    equal      ${expected_text}    