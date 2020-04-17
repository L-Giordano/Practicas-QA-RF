*** Settings ***
Library   SeleniumLibrary
Library   String

*** Variables ***
${Browser}   chrome
${Homepage}   https://www.demoblaze.com/
@{items}    1   2   3   4   5   6   7
@{listaProductos}   Sony vaio i5   Sony vaio i7   MacBook air   Dell i7 8gb   2017 Dell 15.6 Inch   MacBook Pro

*** Keywords ***
Open Homepage
    Set Selenium Timeout   10.0
    Set Selenium Speed   0.2
    Open Browser   ${Homepage}   ${Browser}
