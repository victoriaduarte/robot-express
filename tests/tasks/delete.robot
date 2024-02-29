*** Settings ***
Documentation    Test scenarios of task delete

Resource    ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Should delete a task
    ${data}    Get fixture    tasks    delete
    
    Clean user from database    ${data}[user][email]
    Insert user in database     ${data}[user]

    POST user session    ${data}[user]
    POST a new task      ${data}[task]

    Submit login form           ${data}[user]
    User should be logged in    ${data}[user]
    
    Delete task    ${data}[task][name]
    
    Task should not exist    ${data}[task][name]