*** Settings ***
Resource            Keywords_Global.robot

Suite Setup          Inicializar sistema p/pruebas
Suite Teardown       Teardown espc


*** Test Cases ***

OPcart-001 Realizar sign in en el sitio
    [Tags]      Register

    Ir a pagina de registro
    Registrar nuevo Usuario
    Verificar registro exitoso


OPcart-002 Realizar log out
    [Tags]      Logout

    Log Out
    Verificar Logout exitoso


OPcart-003 Realizar log In
    [Tags]      Login

    Ir a pagina de Log In
    Realizar Log In
    Verificar login
