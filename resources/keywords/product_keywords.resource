*** Keywords ***
product_page
    [Documentation]    go to product page
    common_keywords.Wait_until_element_visible_and_click    ${nav_bar['product_btn']}
    Wait Until Element Is Visible    ${Category['women']}
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