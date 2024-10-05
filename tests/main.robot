*** Settings ***
Resource    ../import.robot
Suite Setup    common_keywords.open website
Suite Teardown    Close All Browsers    

*** Test Cases ***
Home Page Verify
    [Tags]    home_verify
    common_keywords.page_verification    Home    #if home is the current page it will reloading the page

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

Login Fault Account
    common_keywords.sign_login_page
    common_keywords.page_verification    ${login_page_locator['verify_text']}  
    common_keywords.screen_capture    test_module=login
    common_keywords.login    login_email=robottes10234@gmail.com    login_password=Fasword!
    common_keywords.page_verification    incorrect!
    common_keywords.screen_capture    test_module=login_failed

Signin Existing
    common_keywords.sign_login_page
    register_keywords.register    testName    robottesting10234@gmail.com 
    common_keywords.page_verification    exist!
    common_keywords.screen_capture    test_module=register_existing

Contact Us
    [Tags]    contact
    common_keywords.contact_us
    common_keywords.page_verification    contact
    common_keywords.inform_contact    first_name=    email=
    common_keywords.screen_capture    test_module=contact_us
    common_keywords.submit_contact_us

Products
    [Tags]    products
    product_keywords.product_page
    common_keywords.screen_capture    test_module=products
    product_keywords.view_product    product_id=1
    product_keywords.verify_product_view
Verify Testcases Page
    [Tags]    testcases_page
    common_keywords.test_cases_page
    common_keywords.screen_capture    test_module=test_cases

Search Products
    [Tags]    search_product
    product_keywords.product_page
    product_keywords.search_product    product_name=Blue Top
    common_keywords.screen_capture    test_module=search product

Verify Home Page Subcription
    [Tags]    home_sub
    common_keywords.page_verification    Home
    common_keywords.Home_subscribe
    common_keywords.screen_capture    test_module=subscribe

Add Products in Cart
    [Tags]    shopping

    product_keywords.product_page
    common_keywords.page_verification    Category
    product_keywords.add_products    Blue Top    Fancy Green Top    Soft Stretch Jeans
    
    # can't click add to card due to something.