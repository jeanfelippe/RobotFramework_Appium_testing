*** Settings ***
Library       AppiumLibrary


Resource    ../resource/home.resource
Resource    ../resource/login.resource
Resource    ../resource/checkout.resource
Test Setup    Iniciar Sessão
#Test Teardown    Encerrar Sessão


*** Test Cases ***
Teste checkout com sucesso
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040
   
    Dado que Adiciono produtos
    # Wait Until Page Contains    text=Products
    # Click Element    xpath=(//*[@content-desc="Product Image"])[1]
    # Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/priceTV"]

    # ${preco}    Get Text    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/priceTV"]
    # Should Be Equal    ${preco}       $ 29.99
    
    # Click Element    xpath=//android.widget.Button[@content-desc="Tap to add product to cart"]

    # Click Element    xpath=//android.widget.ImageView[@content-desc="Displays number of items in your cart"]


    E Confiro carrinho

    # Wait until page Contains Element   xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/titleTV"]

    # Wait until page Contains Element   xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/priceTV"]

    # Wait until page Contains Element   xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/totalPriceTV"]
    
    E acesso checkout
    # Click Element    xpath=//android.widget.Button[@content-desc="Confirms products for checkout"]
            
    # Wait Until Page Contains Element    id=com.saucelabs.mydemoapp.android:id/enterShippingAddressTV

    # Input Text        id=com.saucelabs.mydemoapp.android:id/fullNameET    text=Jean Felippe

    # Input Text    id=com.saucelabs.mydemoapp.android:id/address1ET    text=Rio de Janeiro

    # Input Text    id=com.saucelabs.mydemoapp.android:id/address2ET    text=Rio de Janeiro

    # Input Text    id=com.saucelabs.mydemoapp.android:id/cityET    text=Rio de Janeiro

    # Input Text    id=com.saucelabs.mydemoapp.android:id/stateET     text=RJ

    # Input Text    id=com.saucelabs.mydemoapp.android:id/zipET    text=21031620

    # Input Text    id=com.saucelabs.mydemoapp.android:id/countryET    text=Brazil

    # Click Element    xpath=//android.widget.Button[@content-desc="Saves user info for checkout"]

  
    E ao conferir e concluir a compra    nome=Jean    cartao=2302555010203020    exp=0331    sec_code=123
    # Input Text     com.saucelabs.mydemoapp.android:id/nameET    text="Testando aqui"

    # Input Text     com.saucelabs.mydemoapp.android:id/cardNumberET   text="2302555010203020"

    # Input Text     com.saucelabs.mydemoapp.android:id/expirationDateET   text="0331"

    #  Input Text     com.saucelabs.mydemoapp.android:id/securityCodeET    text="123"


    # Click Element    xpath=//android.widget.Button[@content-desc="Saves payment info and launches screen to review checkout data"]

    Quando Acessar Ultima tela checkout
    #Click Element    xpath=//android.widget.Button[@content-desc="Completes the process of checkout"]

    Então exibira mensagem final
    #Wait until page Contains    text=Checkout Complete