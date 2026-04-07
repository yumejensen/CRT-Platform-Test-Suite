*** Settings ***

Documentation           Assignment 1: Use the example Webshop
Library                 QWeb 

*** Test Cases ***

Navigate to the webshop URL
    GoTo    https://qentinelqi.github.io/shop/
Verify that the price of Gerald the Giraffe T shirt is $9.00
    VerifyText    $9.00    anchor=Gerald the giraffe    timeout=20s
Add one Gerald the Giraffe T shirt to the shopping cart
    ClickText    Gerald the Giraffe
    ClickText    Add to Cart           timeout=10s       
Verify that the total of the shopping basket is $9.00
    VerifyText    Cart summary    timeout=10s
    VerifyText    $9.00    anchor=Total    timeout=10s

*** Comments ***
hi