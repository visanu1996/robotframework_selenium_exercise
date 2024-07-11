*** Settings ***
Resource    ../import.robot
Suite Teardown    Close All Browsers

*** Test Cases ***
test open browser
    common_keywords.open website
    common_keywords.page verification    //*/img[contains(@src,'logo.png')]