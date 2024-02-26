*** Settings ***
Documentation    Elements and actions in login page

Library    Browser
Library    String

*** Keywords ***
Submit login form
    [Arguments]    ${user}
    Fill Text    css=input[placeholder$=mail]    ${user}[email]
    Fill Text    css=input[placeholder=Senha]    ${user}[password]
    Click    css=button >> text=Entrar

User should be logged in
    [Arguments]    ${user}

    ${element}    Set Variable    css=header .right small

    Wait For Elements State    css=${element}
    ...    visible    5    
    
    @{full_name}=  Split String    ${user}[name]    ${SPACE}
    Get Text    css=${element}    equal    Olá, ${full_name}[0]

    Get Url    equal     http://localhost:3000/tasks