Lifecycle:
Examples:
|swaguserName	         |password	    |
|standard_user	         |secret_sauce	|
|performance_glitch_user |secret_sauce	|


Scenario: 4.1,4.2 Add item to the shopping cart
When Navigate to the SauceDemo website homepage
When I fill <swaguserName>,<password> to saucedemo website
Then number of elements found by `xpath(//*[contains(text(),'<itemName>')])` is equal to `1`
When I click on element located by `<addToCartButtonId>`


Examples:
|itemName                    |itemPageId |addToCartButtonId                      |
|Sauce Labs Backpack         |           |id(add-to-cart-sauce-labs-backpack)    |
|Sauce Labs Bike Light       |           |id(add-to-cart-sauce-labs-bike-light)  |
|Sauce Labs Bolt T-Shirt     |           |id(add-to-cart-sauce-labs-bolt-t-shirt)|

Scenario: 4.3,4.4 Validate the number of items in the shopping cart
When Navigate to the SauceDemo website homepage
When I fill <swaguserName>,<password> to saucedemo website

When I click on element located by `linkText(shopping-cart-link)`
Then number of elements found by `xpath(//*[@class='inventory_item_name'])` is equal to `3`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/cart.html`
When reset the application and  logout