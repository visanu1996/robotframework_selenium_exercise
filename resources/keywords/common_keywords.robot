*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
open website
    Open Browser    ${WEB_BROWSER}    ${WEB_DRIVER}    

page verification
    [Documentation]    this keyword is use for verify that the page is visible by detecting by xpath or id
    ...    
    ...    to use *id* as a path just type it id
    ...    
    ...    to use *xpath* as a path you need to have / to be the fisrt string

    [Arguments]    ${path}
    IF    '${path}[0]' == '/'
    Run Keyword And Return    Wait Until Element Is Visible    xpath=${path}    10 
    ELSE IF    '${path}[0]' <> '/'
    Run Keyword And Return    Wait Until Element Is Visible    id=${path}    10  
    END

homepage
    Wait Until Element Is Visible    ${nav_bar['home_btn']}
    Click Element    ${nav_bar['home_btn']}


sign login page
    Wait Until Element Is Visible    ${nav_bar['sign_login_btn']}
    Click Element    ${nav_bar['sign_login_btn']}


contact us
    Wait Until Element Is Visible    ${nav_bar['contact_btn']}
    Click Element    ${nav_bar['contact_btn']}

