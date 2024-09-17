*** Settings ***
#    Libraries    Section
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    DateTime
Library    Screenshot
Library    YAMLLibrary


#    Keywords Section
Resource    ${CURDIR}/resources/keywords/common_keywords.resource
Resource    ${CURDIR}/resources/keywords/product_keywords.resource
Resource    ${CURDIR}/resources/keywords/register_keywords.resource



#    Locator Section
Resource    ${CURDIR}/resources/locators/common_locators.resource
Resource    ${CURDIR}/resources/locators/register_locators.resource
Resource    ${CURDIR}/resources/locators/product_locators.resource

#    Variable Section
Variables    ${CURDIR}/resources/variables/variables.yml