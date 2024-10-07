*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
verify_cart_item
    [Documentation]    to verify item qty by name
    [Arguments]    ${item_name}    &{product_view}
    ${is_error}    Run Keyword And Return Status    Wait Until Element Is Visible    //a[.='${item_name}']/ancestor::tr
    IF    ${is_error}
        ${item_qty}    Get Text    //a[.='${item_name}']/ancestor::tr//button    
            IF    '${item_qty}' == '${product_view['qty']}'
                Log    verify that the qty value is match
            ELSE
                log    qty is not match
            END
    ELSE
        Log    No item was found with this name
    END

