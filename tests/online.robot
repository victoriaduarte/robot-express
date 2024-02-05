*** Settings ***
Documentation        Online

Library        Browser
Resource       ../resources/base.robot

*** Test Cases ***
Webapp should be online
    Start Session
    Get Title        equal    Mark85 by QAx   