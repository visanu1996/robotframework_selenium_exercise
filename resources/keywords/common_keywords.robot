*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
open website
    Open Browser    ${WEB_BROWSER}    ${WEB_DRIVER}    

# page verification
#     [Documentation]    this keyword is use for verify that the page is visible by detecting by xpath or id
#     ...    
#     ...    to use *id* as a path just type it id
#     ...    
#     ...    to use *xpath* as a path you need to have / to be the fisrt string

#     [Arguments]    ${path}
#     IF    '${path}[0]' == '/'
#     Run Keyword And Return    Wait Until Element Is Visible    xpath=${path}    10 
#     ELSE IF    '${path}[0]' <> '/'
#     Run Keyword And Return    Wait Until Element Is Visible    id=${path}    10  
#     END
page_verification
    [Documentation]    to verify that a web page contains the specific text you're looking for
    [Arguments]    ${verify}
    ${n_xpath}    Evaluate    f"//*[contains(text(), '${verify}')]" 
    Log To Console    ${n_xpath}                 
    Wait Until Element Is Visible    ${n_xpath}
homepage
    [Documentation]    go to home page
    Wait Until Element Is Visible    ${nav_bar['home_btn']}
    Click Element    ${nav_bar['home_btn']}


sign_login_page
    [Documentation]    go to signin / login page
    Wait Until Element Is Visible    ${nav_bar['sign_login_btn']}
    Click Element    ${nav_bar['sign_login_btn']}


contact_us
    [Documentation]    go to contact us
    Wait Until Element Is Visible    ${nav_bar['contact_btn']}
    Click Element    ${nav_bar['contact_btn']}


login
    [Documentation]    to use this keyword you can pass two parameter the first one is an *email* the second is a *password*
    [Arguments]    ${login_email}    ${login_password}
    Input Text    ${login_page_locator['email']}    ${login_email}    
    Input Password    ${login_page_locator['password']}    ${login_password}
    screen_capture    test_module=login
    Click Element    ${login_page_locator['confirm_login']}

screen_capture
    [Documentation]    for screen capturing
    ...    
    ...    please set argument to be relate with your test name such as login, register, shop etc.
    [Arguments]    ${test_module}
    ${date}    Get Current Date    result_format=%d%m%Y_%H%M%S%f
    ${path}    Normalize Path    ${CURDIR}../../../results/snapshots/
    ${is_exist}    Run Keyword And Return Status    Directory Should Exist    ${path}
    Run Keyword If    not ${is_exist}    Create Directory    ${path}
    Screenshot.Set Screenshot Directory    ${path}
    Screenshot.Take Screenshot    ${test_module}_${date}    100%    

go_to_text
    [Documentation]    scroll to text 
    ...    
    ...    *Best to use* if there is single word you are trying to find on the current page
    [Arguments]    ${goto}
    ${n_xpath}    Evaluate    f"//*[contains(text(), '${goto}')]" 
    ${is_error}    Run Keyword And Return Status    Wait Until Element Is Visible    ${n_xpath}
    Run Keyword If    not ${is_error}    Scroll Element Into View     ${n_xpath}
    
