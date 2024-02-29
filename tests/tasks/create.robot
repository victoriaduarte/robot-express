*** Settings ***
Documentation    Test scenarios of task creation

Resource    ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Should create a new task
    ${data}    Get fixture    tasks    create
    
    # Precondition
    Clean user from database    ${data}[user][email]
    Insert user in database     ${data}[user]

    Submit login form           ${data}[user]
    User should be logged in    ${data}[user]

    # Create a new task
    Go to task form
    Submit task form    ${data}[task]

    # Assertion
    Task should be created    ${data}[task][name]

Should not create task with duplicate name
    ${data}    Get fixture    tasks    duplicate
    
    # Create new user
    Clean user from database    ${data}[user][email]
    Insert user in database     ${data}[user]

    # User register a new task
    POST user session    ${data}[user]
    POST a new task      ${data}[task]

    # User login into the web application
    Submit login form           ${data}[user]
    User should be logged in    ${data}[user]
    
    # The user tries to register a duplicate task
    Go to task form
    Submit task form    ${data}[task]

    # User should see a notification of duplication
    Notice should be    Oops! Tarefa duplicada.    