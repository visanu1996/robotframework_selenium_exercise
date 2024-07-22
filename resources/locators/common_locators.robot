*** Variables ***

&{nav_bar}    home_btn=//*/a[.=' Home']    logout_btn=//*/a[.=' Logout']    sign_login_btn=//*/a[@href='/login']    product_btn=//*/a[.=' Products']    cart_btn=//*/a[.=' Cart']    test_cases_btn=//*/i[contains(@class,'fa-list')]/parent::a[.=' Test Cases']    api_test_btn=//*/a[contains(.,'API Test')]    contact_btn=//*/a[contains(.,'Contact')]    logout_btn=//a[@href='/logout']
&{login_page_locator}    email=//form[@action="/login"]/input[@name = 'email']    password=password    confirm_login=//button[@data-qa="login-button"]    verify_text=Login to your account




