*** Settings ***
Resource    ${CURDIR}/../import.robot
Suite Setup    Open Sauce Demo


*** Test Cases ***
Add_item_with_normal_user
    [Tags]    add-item
    ${item_name} =    Set Variable    Bike Light


    login.Login_User    ${login_user['standard']}    ${pass}
    common.verify_element    xpath=//div[.='Products']
    Sleep    3
    Get_Item_Details    ${item_name}
    Add_Item_To_Cart     ${item_name}
    Capture Page Screenshot    EMBED

Check_total_item
    Sleep    2s
    Get_Total_Item_In_Cart  
    
Check_Cart
    Check_Cart_Inventory  