*** Settings ***
Resource    ../resource/home.resource
Resource    ../resource/login.resource

Test Setup        	Iniciar Sessão
Test Teardown       Encerrar Sessão

*** Test Cases ***
login com sucesso
    
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040
    
    # Validação
    Wait Until Page Does Not Contain Element    id=com.saucelabs.mydemoapp.android:id/loginTV
    Click Element    xpath=//*[@content-desc="View menu"]
    Wait Until Element Is Visible    xpath=//*[@content-desc="Logout Menu Item"]

Login sem sucesso

    Acessar página de Login
    
    Fazer Login    email=alice@example.com    password=test
    
    # Validação
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/passwordErrorTV
    Wait Until Page Contains    text=Sorry this user has been locked out.

Login e Logout

    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040
    
    # Validação
    Wait Until Page Does Not Contain Element    id=com.saucelabs.mydemoapp.android:id/loginTV

    Fazer Logout

    # Validação
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/loginTV


Login sem sucesso faltando campo
    Acessar página de Login
    
    # Login sem email
    Fazer Login    email=${EMPTY}    password=${EMPTY}
    
    # validação
    Wait Until Element Is Visible    xpath=//*[@resource-id="com.saucelabs.mydemoapp.android:id/nameErrorTV" and @text="Username is required"]
    
    # Login sem senha
    Fazer Login    email=test@test.com    password=${EMPTY}
    
    # validação
    Wait Until Element Is Visible    xpath=//*[@resource-id="com.saucelabs.mydemoapp.android:id/passwordErrorTV" and @text="Enter Password"]