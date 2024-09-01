*** Settings ***
Resource    ../import.robot
Suite Setup    common_keywords.open website
Suite Teardown    Close All Browsers    

*** Test Cases ***
open browser
    common_keywords.open website
    common_keywords.page_verification    Home

Signin
    common_keywords.sign_login_page
    register_keywords.register    testName    robottesting10234@gmail.com
    common_keywords.go_to_text    Enter Account
    register_keywords.add_account_info    FakePassword!    dob=1994/1/1
    register_keywords.add_address_info    FirstName    LastName    india    0555555555
    screen_capture    test_module=register
    register_keywords.confirm_register
    register_keywords.confirm_account_create
    common_keywords.sign_out
    
Login
    common_keywords.sign_login_page
    common_keywords.page_verification    ${login_page_locator['verify_text']}  
    common_keywords.screen_capture    test_module=login
    common_keywords.login    login_email=robottesting10234@gmail.com    login_password=FakePassword!
    common_keywords.sign_out

login_fault_account
    common_keywords.sign_login_page
    common_keywords.page_verification    ${login_page_locator['verify_text']}  
    common_keywords.screen_capture    test_module=login
    common_keywords.login    login_email=robottes10234@gmail.com    login_password=Fasword!
    common_keywords.page_verification    incorrect!
    common_keywords.screen_capture    test_module=login_failed

signin_existing
    common_keywords.sign_login_page
    register_keywords.register    testName    robottesting10234@gmail.com 
    common_keywords.page_verification    exist!
    common_keywords.screen_capture    test_module=register_existing

contact_us
    [Tags]    contact
    common_keywords.contact_us
    common_keywords.page_verification    contact
    common_keywords.inform_contact    first_name=    email=
    common_keywords.screen_capture    test_module=contact_us
    common_keywords.submit_contact_us

products
    common_keywords.product_page
    common_keywords.screen_capture    test_module=products

verify_testcases_page
    [Tags]    testcases_page
    common_keywords.test_cases_page
    common_keywords.screen_capture    test_module=test_cases
