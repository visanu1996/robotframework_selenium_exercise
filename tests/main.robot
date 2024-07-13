*** Settings ***
Resource    ../import.robot
Suite Teardown    Close All Browsers

*** Test Cases ***
open browser
    common_keywords.open website
    common_keywords.page verification    //*/img[contains(@src,'logo.png')]


Login
    common_keywords.sign login page
    common_keywords.page verification    ${login['page_verify']}  
    common_keywords.screen_capture    test_module=login
    common_keywords.login    login_email=Test    login_password=Testing
    