# RobotFramework_Appium_testing
Repositório utilizado para armazenamento dos estudos envolvendo Robot para aplicações móveis com a utilização do framework de testes automatizados Appium


# Automacao_de_Testes_com_RobotFramework_e_Appium
Projeto de Automação de Testes Utilizando Robot Framework com Appium

Créditos ao curso utilizado como fonte e apoio em diversos momentos: https://www.udemy.com/course/robot-framework-testes-mobile-para-android-com-appium/?couponCode=MT300725G1

Curso foi utilizado como referência para piloto do projeto.



# [Escopo]:

Realizar automação de testes para aplicativos android como material de estudo




# [Frameworks]:

_Robot Framework

_Appium


# [Conceitos/Metodologia]:

_PageObjects;



# [Atalhos e dicas Eclipse]:

_Configurar SDK Android em variáveis de ambiente para facilitar durante os testes

ANDROID_HOME = url= C:\Users\Jean\AppData\Local\Android\Sdk

E incluir no path dentro de variaveis de ambiente = %ANDROID_HOME%\platform-tools


# [Libs útilizadas]

Executar: npm i appium

Executar: npx appium driver install uiautomator2

# [Funções úteis]:

--Uma forma para executar o código dentro da IDE gerando report de forma organizada, execute o seguinte comando: robot -d ./result -L trace .\src\tests\home.robot


# [Verificar se o emulador está ativo]

cd C:\Users\Jean\AppData\Local\Android\Sdk\platform-tools
-Após acessar diretorio platform-tools no cmd, executar comando= adb devices

# [Dicas Android Inspector]

--Executar o appium(comando: npx appium no cmd)

--Informar as capabilities do projeto no appium Inspector

--Clicar em Start session no appium inspector 


# [Abrir o emulador Android]

_Instale o Android Studio

_Realize o download e a configuração do emulador dentro do Android Studio

_Para Executar o emulador sem precisar abrir o Android Studio, execute o comando no cmd(encontre a pasta emulator): cd C:\Users\Jean\AppData\Local\Android\Sdk\emulator

_Executar no mesmo cmd dentro do diretório do emulator o seguinte comando(no lugar de 'Pixel etc'...substitua pelo nome do seu emulador): emulator -avd Pixel_4a_API_36


# [Como testar]

-Abrir cmd e digitar comando: appium

-Abrir o emulador( executar no cmd): cd C:\Users\Jean\AppData\Local\Android\Sdk\emulator

-Executar no mesmo cmd: emulator -avd Pixel_4a_API_36

-Executar o código dentro da IDE clicando na setinha verde
  

