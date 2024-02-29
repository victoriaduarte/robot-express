*** Settings ***
Documentation    Test scenarios of task update

Resource    ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Should mark a task as done
    ${data}    Get fixture    tasks    done
    
    Clean user from database    ${data}[user][email]
    Insert user in database     ${data}[user]

    POST user session    ${data}[user]
    POST a new task      ${data}[task]

    Submit login form           ${data}[user]
    User should be logged in    ${data}[user]
    
    Mark task as done      ${data}[task][name]
    
    Task should be done    ${data}[task][name]