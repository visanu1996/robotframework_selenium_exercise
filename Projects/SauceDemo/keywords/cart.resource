*** Settings ***
Library    SeleniumLibrary
Library    Collections



*** Keywords ***
Set_Item_Locators
    [Arguments]    ${i_name}
    ${item_card}    Set Variable    //div[a/div[contains(.,'${i_name}')]]   # Item card
    ${item_desc}    Set Variable    ${item_card}/div[contains(@class,'item_desc')]    # Item description
    ${item_price}   Set Variable    ${item_card}/following-sibling::div[contains(@class,'pricebar')]/div    # Price
    ${add_item}      Set Variable    ${item_card}/following-sibling::div[contains(@class,'pricebar')]//button   # Add or Remove to cart
    Set Global Variable    ${item_card}
    Set Global Variable    ${item_desc} 
    Set Global Variable    ${item_price} 
    Set Global Variable    ${add_item} 

Verify_Item_Existence
    [Arguments]    ${item_xpath}
    ${status}    common.verify_element    ${item_xpath}
    Run Keyword If    not ${status}    Log    No element found for ${item_xpath}.
    RETURN    ${status}

Get_Item_Details
    [Documentation]    use to get item details by contains item name
    [Arguments]    ${i_name}
    
    Set_Item_Locators    ${i_name}

    ${status}    Verify_Item_Existence    ${item_card}
    IF    not ${status}
        Log    no element found in Get_item_details.
    ELSE
        ${price}    common.Get text to verify    ${item_price}
        ${description}    common.Get text to verify    ${item_desc}

        Log    The price of ${i_name} is: ${price}
        Log    The description of ${i_name} is: ${description}
    END


Add_Item_To_Cart
    [Documentation]    use to add an item to cart by contains item name
    [Arguments]    ${i_name}

    &{locators}    Set_Item_Locators    ${i_name}
    
    ${status}    Verify_Item_Existence    ${item_card}
    IF    not ${status}
        Log    no element found in Add_item_to_cart.
    ELSE
        Click Element    ${add_item}
    END