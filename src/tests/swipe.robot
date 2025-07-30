*** Settings ***
Resource    ../resource/home.resource
Test Setup    Iniciar Sessão
Test Teardown    Encerrar Sessão

*** Test Cases ***
Test com Swipe - Forma 1 - Dinâmico
    
    # Navegação
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//*[@resource-id="com.saucelabs.mydemoapp.android:id/itemTV" and @text="Drawing"]
    Wait Until Element Is Visible    xpath=//*[@resource-id="com.saucelabs.mydemoapp.android:id/drawingTV"]

    ${location}    Get Element Location    xpath=//*[@content-desc="Pad to draw on"]
    Log To Console    ${location}
    
    ${new_x}    Evaluate    ${location}[x]+300
    ${new_y}    Evaluate    ${location}[y]+400

    Swipe    ${location}[x]    ${location}[y]    ${new_x}    ${new_y} 

    Sleep    2s

Test com Swipe - Forma 2 - Fixo

    # Navegação
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//*[@resource-id="com.saucelabs.mydemoapp.android:id/itemTV" and @text="Drawing"]
    Wait Until Element Is Visible    xpath=//*[@resource-id="com.saucelabs.mydemoapp.android:id/drawingTV"]

    # ${location}    Get Element Location    xpath=//*[@content-desc="Pad to draw on"]
    # Log To Console    ${location}

    ${location}    Create Dictionary    x=100    y=500
    
    ${new_x}    Evaluate    ${location}[x]+300
    ${new_y}    Evaluate    ${location}[y]+400

    Swipe    ${location}[x]    ${location}[y]    ${new_x}    ${new_y} 

    Sleep    2s

Utilizar Swipe para desenhar uma letra

    # Letra possíveis: E,T,Y,I,F,H,K,L,Z,C,V,N,M

    # Navegação
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//*[@resource-id="com.saucelabs.mydemoapp.android:id/itemTV" and @text="Drawing"]
    Wait Until Element Is Visible    xpath=//*[@resource-id="com.saucelabs.mydemoapp.android:id/drawingTV"]
    
    # C
    ${location}    Create Dictionary    x=100    y=500
    ${new_x}    Evaluate    ${location}[x]+300
    Swipe    ${location}[x]    ${location}[y]    ${new_x}    ${location}[y] 
    
    ${location}    Create Dictionary    x=100    y=500
    ${new_y}    Evaluate    ${location}[y]+400
    Swipe    ${location}[x]    ${location}[y]    ${location}[x]    ${new_y} 
    
    ${location}    Create Dictionary    x=100    y=900
    ${new_x}    Evaluate    ${location}[x]+300
    Swipe    ${location}[x]    ${location}[y]    ${new_x}    ${location}[y] 

    Sleep    2s