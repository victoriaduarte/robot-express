*** Settings ***
Documentation    Alert components elements and actions

Library    Browser

*** Keywords ***
Alert should be
    [Arguments]    ${expected_text}

    ${element}    Set Variable    css=.alert-error
    
    # Assertion
    Wait For Elements State    ${element} >> text=${expected_text}   visible    5