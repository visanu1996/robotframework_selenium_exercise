*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Login_User
    [Documentation]    have 4 username to login 
    ...    [standard,locked,problem,perf]
    [Arguments]    ${user}    ${secret}
    
    common.verify_element    ${user_name['id']}
    
    Input Text    ${user_name['id']}    ${user}

    Input Password    ${password['id']}    ${secret}
    
    Click Element    ${login_btn['xpath']}


    
# Remove loop for (make code alot slower than it should be)

Log out
    [Documentation]    for log out.
    
    ${is_exist}    Run Keyword And Return Status    Wait Until Element Is Visible    ${logout}['menu']    ${global_variable['global_wait']}
    
    IF    not ${is_exist}
        Log    "Menu button is not visible.
        RETURN
    ELSE
        Click Element    ${logout}['menu']
        
        ${logout_exist}    Run Keyword And Return Status    Wait Until Element Is Visible    ${logout}['btn']    ${global_variable['global_wait']}
    
        IF    not ${logout_exist}
            Log    "Logout button is not visible after opening the menu."
        ELSE
            Click Element    ${logout}['btn']
        END
    
    END
