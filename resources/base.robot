*** Settings ***
Library    libs/database.py
Library    Browser

Resource    env.robot
Resource    pages/SignupPage.robot

*** Keywords ***
Start Session
    New Browser      browser=chromium
    New Page         ${BASE_URL}