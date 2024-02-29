*** Settings ***
Documentation    Test scenarios of task creation

Resource    ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Should create a new task
    ${data}    Get fixture    tasks    create
    
    # Precondition
    Reset user from database    ${data}[user]

    Login    ${data}[user]

    # Create a new task
    Go to task form
    Submit task form    ${data}[task]

    # Assertion
    Task should be created    ${data}[task][name]

Should not create task with duplicate name
    ${data}    Get fixture    tasks    duplicate
    
    Reset user from database    ${data}[user]

    # User register a new task
    Create a new task from API    ${data}

    # User login into the web application
    Login    ${data}[user]
    
    # The user tries to register a duplicate task
    Go to task form
    Submit task form    ${data}[task]

    # User should see a notification of duplication
    Notice should be    Oops! Tarefa duplicada.    

Should not create task when reach the limit of tags
    ${data}    Get fixture    tasks    tags_limit
    
    Reset user from database    ${data}[user]

    Login    ${data}[user]
    
    Go to task form
    Submit task form    ${data}[task]

    Notice should be    Oops! Limite de tags atingido.   