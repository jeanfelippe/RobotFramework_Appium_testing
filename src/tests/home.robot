*** Settings ***
Library       AppiumLibrary


Resource    ../resource/home.resource


*** Test Cases ***
Testes de inicio e fim do app
    Iniciar Sessão
    Encerrar Sessão