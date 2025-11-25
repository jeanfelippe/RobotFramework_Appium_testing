*** Settings ***
Library    AppiumLibrary
Library    String

*** Keywords ***
Adicionar Produto
    [Arguments]    ${posicao_produto}    ${nome_produto}    ${preco_produto}
    Wait Until Page Contains    text=Products
    Click Element    xpath=(//*[@content-desc="Product Image"])[${posicao_produto}]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/productTV" and @text="${nome_produto}"]
    
    ${preco}    Get Text    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/priceTV"]
    Should Be Equal    ${preco}    ${preco_produto}

    Click Element    xpath=//android.widget.Button[@content-desc="Tap to add product to cart"]

Validar carrinho    
    [Arguments]    ${nome_produto}    ${preco_produto}

    Click Element    xpath=//android.widget.ImageView[@content-desc="Displays number of items in your cart"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/titleTV" and @text="${nome_produto}"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/priceTV" and @text="${preco_produto}"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/totalPriceTV" and @text="${preco_produto}"]

Checkout - prencher dados do usuário
    [Arguments]    ${nome}    ${endereco}    ${cidade}   ${zip}    ${pais}

    Click Element    xpath=//android.widget.Button[@content-desc="Confirms products for checkout"]
    Wait Until Page Contains Element    id=com.saucelabs.mydemoapp.android:id/enterShippingAddressTV
    
    Input Text    id=com.saucelabs.mydemoapp.android:id/fullNameET    text=${nome} 
    Input Text    id=com.saucelabs.mydemoapp.android:id/address1ET    text=${endereco}
    Input Text    id=com.saucelabs.mydemoapp.android:id/cityET    text=${cidade}
    Input Text    id=com.saucelabs.mydemoapp.android:id/zipET    text=${zip}
    Input Text    id=com.saucelabs.mydemoapp.android:id/countryET    text=${pais}
    Click Element    id=com.saucelabs.mydemoapp.android:id/paymentBtn

Checkout - prencher dados de pagamento    
    [Arguments]    ${nome}   ${cartao}    ${exp}   ${sec_code}

    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/enterPaymentMethodTV"]
    
    Input Text    id=com.saucelabs.mydemoapp.android:id/nameET    text=${nome}
    Input Text    id=com.saucelabs.mydemoapp.android:id/cardNumberET    text=${cartao}
    Input Text    id=com.saucelabs.mydemoapp.android:id/expirationDateET    text=${exp} 
    Input Text    id=com.saucelabs.mydemoapp.android:id/securityCodeET    text=${sec_code}
    Click Element    xpath=//android.widget.Button[@content-desc="Saves payment info and launches screen to review checkout data"]

Validar e concluir compra     
    [Arguments]    ${preco_produto}

    Wait Until Page Contains    text=Review your order

    ${location}    Get Element Location    xpath=//android.widget.TextView[@text="Deliver Address"]
    
    ${new_y}    Evaluate    ${location}[y]-500

    Swipe    ${location}[x]    ${location}[y]    ${location}[x]    ${new_y}

    ${frete}    Get Text    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/amountTV"]
    ${frete}    Replace String    ${frete}     $    ${EMPTY}
    ${frete}    Convert To Number    ${frete}

    ${preco_produto}    Replace String    ${preco_produto}     $    ${EMPTY}
    ${preco_produto}    Convert To Number    ${preco_produto}

    ${soma}    Evaluate    ${frete}+${preco_produto}
    ${soma}    Set Variable    $ ${soma} 

    ${valor_total}    Get Text    id=com.saucelabs.mydemoapp.android:id/totalAmountTV

    Should Be Equal    ${soma}    ${valor_total}
    
    Click Element    xpath=//android.widget.Button[@content-desc="Completes the process of checkout"]
    
    Wait Until Page Contains    text=Checkout Complete
    Wait Until Page Contains    text=Continue Shopping
    Click Element    xpath=//android.widget.Button[@content-desc="Tap to open catalog"]

Dado que Adiciono produtos

    Wait Until Page Contains    text=Products
    Click Element    xpath=(//*[@content-desc="Product Image"])[1]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/priceTV"]

    ${preco}    Get Text    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/priceTV"]
    Should Be Equal    ${preco}       $ 29.99
    
    Click Element    xpath=//android.widget.Button[@content-desc="Tap to add product to cart"]

    Click Element    xpath=//android.widget.ImageView[@content-desc="Displays number of items in your cart"]

E Confiro carrinho

    Wait until page Contains Element   xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/titleTV"]

    Wait until page Contains Element   xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/priceTV"]

    Wait until page Contains Element   xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/totalPriceTV"]

E acesso checkout

    Click Element    xpath=//android.widget.Button[@content-desc="Confirms products for checkout"]
            
    Wait Until Page Contains Element    id=com.saucelabs.mydemoapp.android:id/enterShippingAddressTV

    Input Text        id=com.saucelabs.mydemoapp.android:id/fullNameET    text=Jean Felippe

    Input Text    id=com.saucelabs.mydemoapp.android:id/address1ET    text=Rio de Janeiro

    Input Text    id=com.saucelabs.mydemoapp.android:id/address2ET    text=Rio de Janeiro

    Input Text    id=com.saucelabs.mydemoapp.android:id/cityET    text=Rio de Janeiro

    Input Text    id=com.saucelabs.mydemoapp.android:id/stateET     text=RJ

    Input Text    id=com.saucelabs.mydemoapp.android:id/zipET    text=21031620

    Input Text    id=com.saucelabs.mydemoapp.android:id/countryET    text=Brazil

    Click Element    xpath=//android.widget.Button[@content-desc="Saves user info for checkout"]

E ao conferir e concluir a compra    #nome=Jean    cartao=2302555010203020    exp=0331    sec_code=123
    [Arguments]    ${nome}    ${cartao}    ${exp}    ${sec_code}

    Input Text     com.saucelabs.mydemoapp.android:id/nameET    text=${nome}

    Input Text     com.saucelabs.mydemoapp.android:id/cardNumberET   text=${cartao}

    Input Text     com.saucelabs.mydemoapp.android:id/expirationDateET   text=${exp}

     Input Text     com.saucelabs.mydemoapp.android:id/securityCodeET    text=${sec_code}


    Click Element    xpath=//android.widget.Button[@content-desc="Saves payment info and launches screen to review checkout data"]

Quando Acessar Ultima tela checkout

    Click Element    xpath=//android.widget.Button[@content-desc="Completes the process of checkout"]

Então exibira mensagem final
    Wait until page Contains    text=Checkout Complete