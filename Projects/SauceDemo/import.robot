*** Settings ***
Library    SeleniumLibrary



# Keywords Files
Resource    ${CURDIR}/keywords/login.resource
Resource    ${CURDIR}/keywords/common.resource
Resource    ${CURDIR}/keywords/cart.resource

# Locators Files
Resource    ${CURDIR}/resources/loginLocator.resource
Resource    ${CURDIR}/resources/cartLocator.resource



Variables    ${CURDIR}/resources/webConfig.yml



