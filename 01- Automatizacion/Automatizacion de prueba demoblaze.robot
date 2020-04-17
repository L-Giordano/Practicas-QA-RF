*** Settings ***
Library   SeleniumLibrary
Library   String
Resource   Recursos.robot



*** Test Cases ***
AP001 Probar que se pueda eliminar un producto del carrito de compras
    [tags]      Caso1

    Open Homepage
    Wait Until Element Is Visible    xpath=//*[@id="tbodyid"]/div[1]
    Click Element   xpath=//*[@id="tbodyid"]/div[1]/div/div/h4/a
    Wait Until Element Is Visible    xpath=//*[@id="imgp"]/div/img
    Click Element   xpath=//*[@id="tbodyid"]/div[2]/div/a
    Sleep   5.0
    Handle Alert
    Click Element   xpath=//*[@id="cartur"]
    Sleep   2.0
    ${carrito}    Get Text    xpath=//*[@id="tbodyid"]/tr/td[4]/a
    Click Element   xpath=//*[@id="tbodyid"]/tr/td[4]/a
    Sleep   3.0
    Click Element   xpath=//*[@id="navbarExample"]/ul/li[1]/a
    Wait Until Element Is Visible   xpath=//*[@id="cartur"]
    Click Element   xpath=//*[@id="cartur"]
    Sleep   5.0
    Page Should Not Contain    ${carrito}
    Close Browser

AP002 Probar agregar producto al carrito de compras
    [tags]      Caso2

    Open Homepage
    Wait Until Element Is Visible    xpath=//*[@id="tbodyid"]/div[1]
    Click Element   xpath=//*[@id="itemc"]

    :FOR   ${items}   IN   @{items}

    \   Click Element   //*[@id="tbodyid"]/div[${items}]/div/div/h4/a
    \   Wait Until Element Is Visible   xpath=//*[@id="tbodyid"]/div[2]/div/a
    \   ${producto}   Get Text   xpath=//*[@id="tbodyid"]/h2
    \   Click Element   xpath=//*[@id="tbodyid"]/div[2]/div/a
    \   Sleep   2.0
    \   Handle Alert
    \   Click Element   xpath=//*[@id="cartur"]
    \   Wait Until Element Is Visible   xpath=//*[@id="tbodyid"]/tr/td[2]
    \   Element Should Contain   xpath=//*[@id="tbodyid"]/tr/td[2]    ${producto}
    \   Click Element   xpath=//*[@id="tbodyid"]/tr/td[4]/a
    \   Sleep   2.0
    \   Click Element   xpath=//*[@id="navbarExample"]/ul/li[1]/a
    \   Wait Until Element Is Visible    xpath=//*[@id="tbodyid"]/div[1]

    Close Browser

AP003 Verificar lista de productos
    [tags]      Caso3

    Open Homepage
    Wait Until Element Is Visible    xpath=//*[@id="contcont"]/div/div[1]/div/a[3]
    Click Element   xpath=//*[@id="contcont"]/div/div[1]/div/a[3]
    Wait Until Element Is Visible    xpath=//*[@id="contcont"]/div/div[1]/div/a[3]

    :FOR   ${items}   IN   @{listaProductos}
    \   Element Should Contain    xpath=//*[@id="tbodyid"]   ${items}

    Close Browser

