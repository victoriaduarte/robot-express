*** Settings ***
Library    libs/database.py
Library    Browser

*** Keywords ***
Start Session
    [Arguments]    ${page}=${EMPTY}
    New Browser      browser=chromium
    New Page         http://localhost:3000/${page}