*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Open Sauce Demo
    Open Browser    ${WEB['url']}    ${WEB['driver']}    executable_path=C:/Selenium/chromedriver.exe
    
verify_element
    [Documentation]     use to verify that element is on page or not
    [Arguments]    ${element}

    ${is_exist}    Run Keyword And Return Status    Wait Until Element Is Visible    ${element}    ${global_variable['global_wait']}
    IF    not ${is_exist} 
        Log    element isn't visible.
    END
    RETURN    ${is_exist}

Get_text_to_verify
    [Documentation]    to get the text from given element.
    [Arguments]    ${element}
    ${text}    Get Text    ${element}
    Log    ${text}
    RETURN   ${text}

