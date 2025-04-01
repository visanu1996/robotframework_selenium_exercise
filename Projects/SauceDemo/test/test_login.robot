*** Settings ***
Resource    ${CURDIR}/../import.robot
Suite Setup    Open Sauce Demo

*** Variables ***
# for reuseable variables you can change anytime the after the path is change.
${product_tag}=    xpath=//div[.='Products']
${locked_user_tag}=    xpath=//h3[contains(., 'Sorry, this user')]


*** Test Cases ***
Login_standard_user
    [Tags]    normal-user
    login.Login_User    ${login_user['standard']}    ${pass}
    common.verify_element    ${product_tag}
    Log out


Login_locked_user
    login.Login_User    ${login_user['locked']}    ${pass}
    common.verify_element    ${locked_user_tag}
    Get text to verify    ${locked_user_tag}
    
Login_problem_user
    login.Login_User    ${login_user['problem']}    ${pass}
    common.verify_element    ${product_tag}
    Capture Page Screenshot    EMBED
    Log out

Login_perf_user
    login.Login_User    ${login_user['perf']}    ${pass}
    common.verify_element    ${product_tag}
    Capture Page Screenshot    EMBED
