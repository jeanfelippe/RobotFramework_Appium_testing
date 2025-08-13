*** Settings ***
Library       AppiumLibrary


Resource    ../resource/home.resource


*** Test Cases ***
login com sucesso
    Iniciar Sessão
    
    # Acessar menu
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//*[@content-desc="Login Menu Item"]
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/loginTV


    # Inserir dados
    Input Text    id=com.saucelabs.mydemoapp.android:id/nameET    text=bod@example.com
    Input Text    id=com.saucelabs.mydemoapp.android:id/passwordET    text=10203040
   
   Click Element    id=com.saucelabs.mydemoapp.android:id/loginBtn
   
   
    # Validação 
    #valido que botão escrito login não está mais visivel por conta que o usuario está logado já nesse ponto
    #botao de login foi alterado para logout
    Wait Until Page Does Not Contain Element    id=com.saucelabs.mydemoapp.android:id/loginTV

    Click Element    xpath=//*[@content-desc="View menu"]
    #Validar que onde exibia a palavra Login agora exibe a palavra Logout
    Wait Until Element Is Visible    xpath=//*[@content-desc="Logout Menu Item"]
    
    
    Encerrar Sessão