*** Settings ***
Documentation    Elements and actions in task creation page

Library    Browser

*** Keywords ***
Submit task form
    [Arguments]    ${task}
    
    Fill Text    css=input[placeholder="Nome da tarefa"]    ${task}[name]

    ${tags_element}    Set Variable    css=input[name="tags"]

    FOR    ${tag}    IN    @{task}[tags]
        Fill Text     ${tags_element}    ${tag}
        Sleep    1
        Press Keys    ${tags_element}    Enter
    END

    Click    css=button >> text=Cadastrar