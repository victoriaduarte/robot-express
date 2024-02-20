*** Settings ***
Library    libs/database.py
Library    Browser

*** Variables ***
${BASE_URL}    http://localhost:3000

*** Keywords ***
Start Session
    [Arguments]    ${page}=${EMPTY}
    New Browser      browser=chromium
    New Page         ${BASE_URL}/${page}