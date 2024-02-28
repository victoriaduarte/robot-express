*** Settings ***
Documentation    Elements and actions in tasks list page

Library    Browser

*** Keywords ***
Task should be created
    [Arguments]    ${task_name}
    
    ${element}    Set Variable    css=.task-todo >> text=${task_name}
    
    Wait For Elements State    ${element}    visible    5      