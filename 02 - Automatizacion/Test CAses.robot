*** Settings ***

Library             SeleniumLibrary
Library             String
Library             OperatingSystem
Library             DateTime
Library             Collections

Resource            Keywords_Global.robot

Suite Setup          Suite setup esp
Suite Teardown       Teardown espc


*** Test Cases ***

User register
    [Tags]      Register
    Generate Email_New
    Go to Homepage
    Registrar nuevo Usuario      0
                                  #Argumento=0 "no registra a Newsletter"
                                  #Argumento=1 "Registra a Newsletter"
    Verificar registro
    Log Out

User Login

    [Tags]      Login
    Go to Homepage
    Check Login
    Log In
    Verificar login


User purchase
    [Tags]      purchase

    Go to Homepage
    Select article
    Verificar articulo en carrito
    Cambiar cantidad en carrito
    Estimate Shipping & Taxes
    Revisar direccion
    Checkout
    Confirmar compra
    Log Out
