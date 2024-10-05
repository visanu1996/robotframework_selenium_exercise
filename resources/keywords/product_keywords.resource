*** Settings ***
Resource    ../../import.robot
*** Keywords ***
product_page
    [Documentation]    go to product page
    common_keywords.Wait_until_element_visible_and_click    ${nav_bar['product_btn']}
    Wait Until Element Is Visible    ${Category['women']}    ${web_variables.global_wait}
view_product
    [Documentation]    view product item by product id
    [Arguments]    ${product_id}=1
    common_keywords.Wait_until_element_visible_and_click    //a[@href='/product_details/${product_id}']


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


search_product
    [Documentation]    to search product by product name
    [Arguments]    ${product_name}
    common_keywords.Wait_until_element_visible_and_insert    ${search_product}    ${product_name}
    common_keywords.Wait_until_element_visible_and_click    ${search_submit}
    common_keywords.go_to_element    ${first_product}

Add Products
    [Documentation]    To add products to the cart, provide a list like: 
    ...                add_product_list    *T-Shirt    Blue-Top    Dress*     
    [Arguments]    @{item_list}
    
    ${count}    Get Length    ${item_list}

    Log To Console    Number of items to add: ${count}
    Log To Console    Items: @{item_list}

    FOR    ${i}    IN RANGE    ${count}
        Log To Console    Processing item: ${item_list}[${i}]
        
        search_product    ${item_list}[${i}]
        common_keywords.go_to_element    ${carts['add']}
        common_keywords.Wait_until_element_visible_and_click    ${carts['add']}
        Wait Until Element Is Visible    ${carts['success']}    ${web_variables.global_wait}
        
        # Check if it’s the last item
        IF    ${i} < ${count} - 1
            common_keywords.Wait_until_element_visible_and_click    ${carts['continue_shop']}
        ELSE
            common_keywords.Wait_until_element_visible_and_click    ${carts['view_cart']}
            common_keywords.go_to_text    ${item_list}[${count} - 1]
            common_keywords.screen_capture    test_module=add_products
        END
    END
       
