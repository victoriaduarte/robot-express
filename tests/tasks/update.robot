*** Settings ***
Documentation    Test scenarios of task update

Resource    ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Should mark a task as done
    ${data}    Get fixture    tasks    done
    
    Reset user from database      ${data}[user]
    Create a new task from API    ${data}

    Login    ${data}[user]
    
    Mark task as done      ${data}[task][name]
    
    Task should be done    ${data}[task][name]