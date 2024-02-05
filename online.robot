*** Settings ***
Documentation        Online

Library        Browser

*** Test Cases ***
Webapp should be online
    New Browser      browser=chromium        headless=false
    New Page         http://localhost:3000
    Get Title        equal    Mark85 by QAx   
