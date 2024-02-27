*** Settings ***
Documentation    Notification components elements and actions

Library    Browser

*** Keywords ***
Notice should be
    [Arguments]    ${expected_text}

    ${element}    Set Variable    css=.notice p
    
    # Assertion
    Wait For Elements State    ${element}    visible    5
    Get Text                   ${element}    equal      ${expected_text}