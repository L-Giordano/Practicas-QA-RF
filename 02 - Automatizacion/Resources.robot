*** Settings ***

Library             SeleniumLibrary
Library             String
Library             OperatingSystem
Library             DateTime


*** Variables ***
#Settings

${browser}   chrome
${homepage}               https://demo.opencart.com/

${abc}                      abcdefghijklmnopqrstuvwxyz

${Email_New}

#Datos para completar formulario de registro
${First Name}             Chapulin
${Last Name}              Colorado
${Telephone}              987654321
${Adress 1}               La vecindad
${City}                   California
${Country}                Argentina
${State}                  Mendoza
${Password}               Siganmelosbuenos
${CP}                     5501
${exis}         existing

#Locators
${Logo Homepage}              link:Your Store


${My Account}                 link:My Account
${Register}                   link:Register

${Reg_Input_FstName}          xpath://*[@id="input-firstname"]
${Reg_Input_LastName}         xpath://*[@id="input-lastname"]
${Reg_Input_Email}            xpath://*[@id="input-email"]
${Reg_Input_Telephone}        xpath://*[@id="input-telephone"]
${Reg_Input_password}         xpath://*[@id="input-password"]
${Reg_Input_confirm}          xpath://*[@id="input-confirm"]
${Radio_Btn_newsletter}       newsletter
${Accept Terms_1}             xpath://*[@id="content"]/form/div/div/input[1]
${Terminar Reg}               xpath://*[@id="content"]/form/div/div/input[2]
${Login_Btn}                  xpath://*[@id="content"]/div/div[2]/div/form/input

${pagina confirmacion_1}        xpath://*[@id="content"]/h1
${pagina confirmacion_2}        xpath://*[@id="content"]/h2[1]
${msj confirmacion_1}            Your Account Has Been Created!
${msj confirmacion_2}            My Account


${My Account}                  link:My Account
${Logout}                      link:Logout
${Login}                       link:Login


${Lista_articulos}             link:Laptops & Notebooks
${gral_Laptops}                link:Show All Laptops & Notebooks
${Articulo_1}                  link:HP LP3065
${titulo_articulo}             xpath://*[@id="content"]/div/div[2]/h1
${box_cant_art}                xpath://*[@id="input-quantity"]
${btn_add_art}                 xpath://*[@id="button-cart"]
${Btn_Shop_Cart}               link:Shopping Cart

${box_cant_carrito}            xpath://*[@id="content"]/form/div/table/tbody/tr/td[4]/div/input
${btn_refresh_carrito}         xpath://*[@id="content"]/form/div/table/tbody/tr/td[4]/div/span/button[1]
${acordion_shipping}           xpath://*[@id="accordion"]/div[2]/div[1]/h4/a
${lista_country}               xpath://*[@id="input-country"]
${lista_zone}                  xpath://*[@id="input-zone"]
${input_CP}                    xpath://*[@id="input-postcode"]
${btn_get quote}               xpath://*[@id="button-quote"]
${Radio_Btn_shipping_method}   shipping_method
${Radio_Btn_shipping_select}                        flat.flat
${btn_apply shipping}                               xpath://*[@id="button-shipping"]
${btn_checkout}                 link:Checkout

${Payment_Input_FstName}          xpath://*[@id="input-payment-firstname"]
${Payment_Input_LastName}         xpath://*[@id="input-payment-lastname"]
${Payment_Input_Address-1}        xpath://*[@id="input-payment-address-1"]
${Payment_Input_City}             xpath://*[@id="input-payment-city"]
${Payment_Input_CP}               xpath://*[@id="input-payment-postcode"]
${Payment_Input_Country}          xpath://*[@id="input-payment-country"]
${Payment_Input_Zone}             xpath://*[@id="input-payment-zone"]
${btn_payment_continue}           xpath://*[@id="button-payment-address"]

${Radio_Btn_shipping_address}     shipping_address
${Radio_Btn_shipping_address_sel}                             existing
${btn_shipping_continue}          xpath://*[@id="button-shipping-address"]

${Textarea_shipping_Method}       xpath://*[@id="collapse-shipping-method"]/div/p[4]/textarea
${btn_ship_Method_continue}       xpath://*[@id="button-shipping-method"]

${Accept Terms_2}                 xpath://*[@id="collapse-payment-method"]/div/div[2]/div/input[1]
${btn_Pay_Method_continue}        xpath://*[@id="button-payment-method"]

${btn_confirm_order}              xpath://*[@id="button-confirm"]

${pagina confirmacion_3}          xpath://*[@id="content"]/h1
${msj confirmacion_3}             Your order has been placed!

