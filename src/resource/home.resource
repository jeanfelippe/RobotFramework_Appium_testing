*** Settings ***
Library    AppiumLibrary

*** Keywords ***


Iniciar Sessão
    Open Application    http://localhost:4723
    ...        platformName=Android     
    ...        deviceName=Android Emulator  
    ...        automationName=UIAutomator2
    ...        app=${EXECDIR}/apps/sauceLab_NEW_2.2.0-25.apk
    ...        udid=emulator-5554
    ...        autoGrantPermissions=true

    Wait Until Element Is Visible    xpath=//*[@content-desc="App logo and name"]
    Wait Until Page Contains    text=Products

Encerrar Sessão
    Close Application