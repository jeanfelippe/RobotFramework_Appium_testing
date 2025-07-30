*** Settings ***
Library       AppiumLibrary


#Resource    ../resource/home.resource
#a

*** Test Cases ***

Iniciar Sessão
        #Open Application    http://127.0.0.1:4723
        Open Application    http://localhost:4723
        ...    platformName=Android
        ...    deviceName=Android Emulator
        ...    automationName=UIAutomator2
        ...    app=${EXECDIR}/apps/sauceLab_NEW_2.2.0-25.apk
        ...    udid=emulator-5554
        ...    autoGrantPermissions=true
        
        Sleep    5s

        	
        Wait Until Element Is Visible       xpath=//*[@content-desc="App logo and name"]

        Wait Until Page Contains    text=Products

    
    Close Application