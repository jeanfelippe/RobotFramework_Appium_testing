*** Settings ***
Library       AppiumLibrary
#Library    SeleniumLibrary
Resource    ../resource/home.resource
Test Setup    Iniciar Sessão
Test Teardown    Encerrar Sessão


*** Test Cases ***
Test com swipe - forma 1 -dinamico
    
    #Navegação
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//*[@resource-id="com.saucelabs.mydemoapp.android:id/itemTV" and @text="Drawing"]
    Wait Until Element Is Visible    xpath=//*[@resource-id="com.saucelabs.mydemoapp.android:id/drawingTV"]

    # ${location}    Get Element Location   xpath=//*[@content-desc="Pad to draw on"]
    # Log To Console         ${location}
    
    ${location}    Create Dictionary    x=100    y=500


    ${new_x}    Evaluate    ${location}[x]+300
    ${new_y}    Evaluate    ${location}[x]+400

    Swipe    ${location}[x]    ${location}[y]    ${new_x}    ${new_y}
    