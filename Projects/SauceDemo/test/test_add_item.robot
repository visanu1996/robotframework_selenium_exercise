*** Settings ***
Resource    ${CURDIR}/../import.robot
Suite Setup    Open Sauce Demo


*** Test Cases ***
Add_item_with_normal_user
    [Tags]    add-item

    login.Login_User    ${login_user['standard']}    ${pass}
    common.verify_element    xpath=//div[.='Products']
    Sleep    3

    Get_Item_Details_And_Add_To_Cart    Bike Light
    Get_Item_Details_And_Add_To_Cart    Fleece

Check_total_item
    Sleep    2s
    Get_Total_Item_In_Cart  
    
Check_Cart
    Check_Cart_Inventory  