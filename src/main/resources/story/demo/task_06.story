Meta:
@group=smoke
@requirementId=REQ-LOGIN
 
Examples:
| username             | password        |
| ${swagGoodUserName} | ${swagPassword} |
| ${swagSlowUserName} | ${swagPassword} |
 
Scenario: Log in
When I navigate to '${web-application.main-page-url}'
And I input '<username>' into field with name 'user-name'
And I input '<password>' into field with name 'password'
And I click on element located by xpath '//input[@id="login-button"]'
Then page title is equal to 'Swag Labs'
 
Scenario Outline: Add item to the shopping cart
When I click on element located by xpath '//a[@id='<itemPageId>']'
And I click on element located by xpath '//button[@id='<addToCartButtonId>']'
 
Examples:
| itemName     | itemPageId         | addToCartButtonId              |
| Backpack     | item_4_title_link  | add-to-cart-sauce-labs-backpack |
| Bike Light   | item_0_title_link  | add-to-cart-sauce-labs-bike-light |
| Bolt T-Shirt | item_1_title_link  | add-to-cart-sauce-labs-bolt-t-shirt |
 
Scenario: Validate the number of items in the shopping cart
When I click on element located by xpath '//a[@class="shopping_cart_link"]'
Then number of elements found by xpath '//div[@class="cart_item"]' is equal to '3'
 
Scenario: Log out
When I click on element located by xpath '//button[@id="react-burger-menu-btn"]'
And I wait until element located by xpath '//a[@id="reset_sidebar_link"]' becomes visible with timeout of '10s'
And I click on element located by xpath '//a[@id="reset_sidebar_link"]'
And I click on element located by xpath '//a[@id="logout_sidebar_link"]'
Then page title is equal to 'Swag Labs'