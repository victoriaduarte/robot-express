*** Settings ***
Documentation    Elements and actions in login page

Library    Browser

*** Keywords ***
Submit login form
    [Arguments]    ${user}
    Fill Text    css=input[placeholder$=mail]    ${user}[email]
    Fill Text    css=input[placeholder=Senha]    ${user}[password]
    Click    css=button >> text=Entrar