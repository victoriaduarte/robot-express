*** Settings ***
Documentation    Elements and actions in tasks list page

Library    Browser

*** Keywords ***
Task should be created
    [Arguments]    ${task_name}
    
    ${element}    Set Variable    css=.task-todo >> text=${task_name}
    
    Wait For Elements State    ${element}    visible    5 

Task should be done
    [Arguments]    ${task_name}

    ${element}    Set Variable    css=.task-done >> text=${task_name}

    Wait For Elements State    ${element}    visible    5

    Get Style    ${element}    text-decoration-line    equal    line-through

Task should not exist
    [Arguments]    ${task_name}

    ${element}    Set Variable    css=.task-todo >> text=${task_name}

    Wait For Elements State    ${element}    detached    5

Mark task as done
    [Arguments]    ${task_name}

    ${element}    Set Variable    xpath=//strong[text()="${task_name}"]/..//button[@class="item-toggle"]
    
    Wait For Elements State    ${element}    visible    5
    Click    ${element} 

Delete task
    [Arguments]    ${task_name}

    ${element}    Set Variable    xpath=//strong[text()="${task_name}"]/..//button[@class="task-remove"]
    
    Wait For Elements State    ${element}    visible    5
    Click    ${element} 
