*** Settings ***
Resource    ../import.robot
Suite Teardown    Close All Browsers

*** Test Cases ***
open browser
    common_keywords.open website
    Maximize Browser Window
    common_keywords.page_verification    Home
    

Signin
    common_keywords.sign_login_page
    register_keywords.register    testName    robottesting10234@gmail.com
    common_keywords.go_to_text    Enter Account
    register_keywords.add_account_info    FakePassword!    dob=1994/1/1
    register_keywords.add_address_info    FirstName    LastName    india    0555555555
    screen_capture    test_module=register

# Login
#     common_keywords.sign_login_page
#     common_keywords.page_verification    ${login_page_locator['verify_text']}  
#     common_keywords.screen_capture    test_module=login
#     common_keywords.login    login_email=Test    login_password=Testing

