*** Settings ***
#    Libraries    Section
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    DateTime
Library    Screenshot

#    Keywords Section
Resource    ${CURDIR}/resources/keywords/common_keywords.resource
Resource    ${CURDIR}/resources/keywords/register_keywords.resource


#    Locator Section
Resource    ${CURDIR}/resources/locators/common_locators.resource
Resource    ${CURDIR}/resources/locators/register_locators.resource
Resource    ${CURDIR}/resources/locators/product_locators.resource

#    Variable Section
Resource    ${CURDIR}/resources/variables/common_variables.resource
Resource    ${CURDIR}/resources/variables/register_variables.resource