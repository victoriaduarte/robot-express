*** Settings ***
Documentation    Mark85 header elements and actions

Library    Browser
Library    String

*** Keywords ***
User should be logged in
    [Arguments]    ${user}

    ${element}    Set Variable    css=header .right small

    Wait For Elements State    ${element}
    ...    visible    5    
    
    @{full_name}=  Split String    ${user}[name]    ${SPACE}
    Get Text    ${element}    equal    Olá, ${full_name}[0]

    Get Url    equal     http://localhost:3000/tasks

Go to task form
    Click    css=.button-add >> text=Nova Tarefa