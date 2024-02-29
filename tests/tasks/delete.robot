*** Settings ***
Documentation    Test scenarios of task delete

Resource    ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Should delete a task
    ${data}    Get fixture    tasks    delete
    
    Reset user from database    ${data}[user]
    Create a new task from API    ${data}

    Login    ${data}[user]
    
    Delete task    ${data}[task][name]
    
    Task should not exist    ${data}[task][name]