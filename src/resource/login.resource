*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Acessar página de Login
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//*[@content-desc="Login Menu Item"]
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/loginTV

Fazer Login
    [Arguments]    ${email}    ${password}

    Input Text    id=com.saucelabs.mydemoapp.android:id/nameET    text=${email}
    Input Text    id=com.saucelabs.mydemoapp.android:id/passwordET    text=${password}
    Click Element    id=com.saucelabs.mydemoapp.android:id/loginBtn

Fazer Logout
    Click Element    xpath=//*[@content-desc="View menu"]
    Wait Until Element Is Visible    xpath=//*[@content-desc="Logout Menu Item"]
    Click Element        xpath=//*[@content-desc="Logout Menu Item"]
    Wait Until Element Is Visible    xpath=//*[@resource-id="android:id/button1" and @text="LOGOUT"]
    Click Element    xpath=//*[@resource-id="android:id/button1" and @text="LOGOUT"]
