Meta:
@expressions
 
Scenario: Log In
When I navigate to '${web-application.main-page-url}'
And I input '${swagGoodUserName}' into field with name 'user-name'
And I input '${swagPassword}' into field with name 'password'
And I click on element located by xpath '//input[@id="login-button"]'
Then page title is equal to 'Swag Labs'
 
Scenario Outline: Add item to the shopping cart
When I click on element located by xpath '//a[@id="<itemPageId>"]'
And I click on element located by xpath '//button[@id="<addToCartButtonId>"]'
 
Examples:
| itemName   | itemPageId         | addToCartButtonId               |
| Backpack   | item_4_title_link  | add-to-cart-sauce-labs-backpack |
 
Scenario: Populate checkout data
When I click on element located by xpath '//a[@class="shopping_cart_link"]'
And I click on element located by xpath '//button[@id="checkout"]'
And I input '${random.firstName}' into field with name 'first-name'
And I input '${random.string(6)}' into field with name 'last-name'
And I input '${random.pattern("[A-Z]{3}-\\d{5}")}' into field with name 'postal-code'
And I click on element located by xpath '//input[@id="continue"]'
Then I take screenshot
 
Scenario: Complete checkout process
When I click on element located by xpath '//button[@id="finish"]'
Then I save text from element located by xpath '//h2' to variable 'actualMessage'
Then I initialize variable 'expectedMessage' with value '#{loadResource("data/message.txt")}'
Then '${actualMessage}' is equal to '#{eval(expectedMessage)}'