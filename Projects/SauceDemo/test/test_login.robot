*** Settings ***
Resource    ${CURDIR}/../import.robot
Suite Setup    Open Sauce Demo


*** Test Cases ***
Login_standard_user
    [Tags]    normal-user
    login.Login_User    ${login_user['standard']}    ${pass}
    common.verify_element    xpath=//div[.='Products']
    Log out


Login_locked_user
    login.Login_User    ${login_user['locked']}    ${pass}
    common.verify_element    xpath=//h3[contains(., 'Sorry, this user')]
    Get text to verify    xpath=//h3[contains(., 'Sorry, this user')]
    
Login_problem_user
    login.Login_User    ${login_user['problem']}    ${pass}
    common.verify_element    xpath=//div[.='Products']
    Capture Page Screenshot    EMBED
    Log out

Login_perf_user
    login.Login_User    ${login_user['perf']}    ${pass}
    common.verify_element    xpath=//div[.='Products']
    Capture Page Screenshot    EMBED


# 

Add_item_with_normal_user
    [Tags]    add-item
    
    login.Login_User    ${login_user['standard']}    ${pass}
    common.verify_element    xpath=//div[.='Products']
    Sleep    3
    Get_Item_Details    Bike Light
    Add_Item_To_Cart     Bike Light
    Capture Page Screenshot    EMBED