*** Settings ***
Library    libs/database.py
Library    Browser

Resource    env.resource
Resource    pages/SignupPage.resource

*** Keywords ***
Start Session
    New Browser      browser=chromium
    New Page         ${BASE_URL}