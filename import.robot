*** Settings ***
#    Libraries    Section
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    DateTime
Library    Screenshot

#    Keywords Section
Resource    ${CURDIR}/resources/keywords/common_keywords.robot
Resource    ${CURDIR}/resources/keywords/register_keywords.robot


#    Locator Section
Resource    ${CURDIR}/resources/locators/common_locators.robot
Resource    ${CURDIR}/resources/locators/register_locators.robot


#    Variable Section
Resource    ${CURDIR}/resources/variables/common_variables.robot
Resource    ${CURDIR}/resources/variables/register_variables.robot