*** Settings ***
Library       AppiumLibrary


Resource    ../resource/home.resource
Resource    ../resource/login.resource
Test Setup    Iniciar Sessão
Test Teardown    Encerrar Sessão


*** Test Cases ***
Teste checkout com sucesso

    #Adicionar produto
    Click Element    xpath=(//*[@content-desc="Product Image"])[1]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/priceTV"]

    ${preco}    Get Text    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/priceTV"]
    Should Be Equal    ${preco}       $ 29.99
    
    Click Element    xpath=//android.widget.Button[@content-desc="Tap to add product to cart"]

    Click Element    xpath=//android.widget.ImageView[@content-desc="Displays number of items in your cart"]


    #Conferir carrinho

    Wait until page Contains Element   xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/titleTV"]

    Wait until page Contains Element   xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/priceTV"]

    Wait until page Contains Element   xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/totalPriceTV"]
    
    #Prosseguir checkout
    Click Element    xpath=//android.widget.Button[@content-desc="Confirms products for checkout"]

    Fazer Login    email=bod@example.com    password=10203040
   
    #Conferir e concluir a compra

    Input Text        id=com.saucelabs.mydemoapp.android:id/fullNameET    Jean Felippe

    Input Text    id=com.saucelabs.mydemoapp.android:id/address1ET    Rio de Janeiro

    Input Text    id=com.saucelabs.mydemoapp.android:id/address2ET    Rio de Janeiro

    Input Text    id=com.saucelabs.mydemoapp.android:id/cityET    Rio de Janeiro

    Input Text    id=com.saucelabs.mydemoapp.android:id/stateET     RJ

    Input Text    id=com.saucelabs.mydemoapp.android:id/zipET    21031620

    Input Text    id=com.saucelabs.mydemoapp.android:id/countryET    Brazil

    Click Element    xpath=////android.widget.Button[@content-desc="Saves user info for checkout"]