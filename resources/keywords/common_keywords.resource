*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
open website
    
    Open Browser    ${WEB_BROWSER}    ${WEB_DRIVER}
    Maximize Browser Window
    Sleep    3

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
    Wait_until_element_visible_and_click    //*[contains(text(), "${verify}")]
homepage
    [Documentation]    go to home page
    Wait_until_element_visible_and_click    ${nav_bar['home_btn']}

sign_login_page
    [Documentation]    go to signin / login page
    Wait_until_element_visible_and_click    ${nav_bar['sign_login_btn']}

contact_us
    [Documentation]    go to contact us
    Wait_until_element_visible_and_click    ${nav_bar['contact_btn']}

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
    [Documentation]    Scroll to a text element on the current page.
    ...                *Best to use* if there is a single word you are trying to find.
    [Arguments]    ${goto}
    ${is_error}    Run Keyword And Return Status    Wait Until Element Is Visible    //*[contains(text(), '${goto}')]
    Run Keyword If    not ${is_error}    Scroll Element Into View     //*[contains(text(), '${goto}')]
    
sign_out
    Click Element    ${nav_bar['logout_btn']}
    
inform_contact
    [Documentation]    use this keyword to inform detail from contact page
    [Arguments]    ${first_name}    ${email}
    Input Text    name=${contact_locator['name']}    ${first_name}
    Input Text    name=${contact_locator['email']}    ${email}    
    Input Text    name=${contact_locator['subject']}    Testing Robotframework
    Input Text    name=${contact_locator['body']}    put your message here
#    Choose File    name=${contact_locator['file_upload']}    file_path
submit_contact_us
    Click Element    name=${contact_locator['submit_btn']}

product_page
    [Documentation]    go to product page
    Wait_until_element_visible_and_click    ${nav_bar['product_btn']}
    Wait Until Element Is Visible    ${Category['women']}
view_product
    [Documentation]    view product item by product id
    [Arguments]    ${product_id}=1
    Wait_until_element_visible_and_click    //a[@href='/product_details/${product_id}']

verify_product_view
    [Documentation]    to verify that the detail in product view is not empty
    ${name}    Get Text    ${product_details['name']}
    ${category}    Get Text    ${product_details['category']}
    ${price}    Get Text    ${product_details['price']}
    ${availability}    Get Text    ${product_details['availability']}
    ${condition}    Get Text    ${product_details['condition']}
    ${brand}    Get Text    ${product_details['brand']}
    @{product_details}    Create List    ${name}    ${category}    ${price}    ${availability}    ${condition}    ${brand}
    Log    product details : @{product_details}

test_cases_page
    [Documentation]    go to test cases page
    Wait_until_element_visible_and_click     ${nav_bar['test_cases_btn']}


Wait_until_element_visible_and_click
    [Documentation]    wait until element is Visible with for loop
    [Arguments]    ${element}
    ${is_visible}    Run Keyword And Return Status     Wait Until Element Is Visible    ${element}    5
    FOR    ${counter}    IN RANGE    1    ${global_count}
        IF    ${is_visible}    
            Click Element    ${element}    
            Exit For Loop
        END
    END
    Run Keyword If    not ${is_visible}    Log    Element not found.