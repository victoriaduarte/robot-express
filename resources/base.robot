*** Settings ***
Library    Browser

*** Keywords ***
Start Session
    New Browser      browser=chromium
    New Page         http://localhost:3000