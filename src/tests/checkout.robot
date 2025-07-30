*** Settings ***
Resource    ../resource/home.resource
Resource    ../resource/login.resource
Resource    ../resource/checkout.resource

Test Setup    Iniciar Sessão
Test Teardown    Encerrar Sessão

*** Test Cases ***
Teste checkout com sucesso

    # Fazer login
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040
    
    # Adicionar Produto
    Adicionar Produto    posicao_produto=1    nome_produto=Sauce Labs Backpack    preco_produto=$ 29.99
    
    # Conferir carrinho
    Validar carrinho    nome_produto=Sauce Labs Backpack    preco_produto=$ 29.99
    
    # Prosseguir checkout - usuário
    Checkout - prencher dados do usuário    nome=Gustavo    endereco=Rua test, 111    cidade=Cidade test    zip=123456789    pais=Brazil

    # Prosseguir checkout - pagamento
    Checkout - prencher dados de pagamento    nome=Gustavo    cartao=1281982198    exp=01/30    sec_code=123
    
    # Conferir e concluir compra
    Validar e concluir compra     preco_produto=$ 29.99