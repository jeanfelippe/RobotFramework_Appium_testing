*** Settings ***
Library       AppiumLibrary


Resource    ../resource/home.resource
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
    
    #Prosseguir
