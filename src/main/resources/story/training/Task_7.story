Meta:
    @group Training
    @requirementId MyTask-0007

Scenario: Navigate to the website homepage
Given I am on main application page

Scenario: Log In
When I enter '${swagGoodUserName}' into the element located by id 'user-name'
And I enter '${swagPassword}' into the element located by id 'password'
And I click on the element located by id 'login-button'
Then the page title is equal to "Swag Labs"

Scenario Outline: Add item to the shopping cart
Examples:
| itemName               | itemPageId           | addToCartButtonId                 |
| Sauce Labs Backpack    | item_4_title_link    | add-to-cart-sauce-labs-backpack   |
When I click on the element located by id '<itemPageId>'
And I click on the element located by id '<addToCartButtonId>'
And I click on the element located by id 'shopping_cart_container'

Scenario: Populate checkout data
When I click on the element located by id 'checkout'
And I enter '#{generateRandomString(John,5)}' into the element located by id 'first-name'
And I enter '#{generateRandomString(Smith,7)}' into the element located by id 'last-name'
And I enter '#{generateRandomString([A-Z]{3}-\d{5})}' into the element located by id 'postal-code'
When I take screenshot

Scenario: Complete checkout process
When I click on the element located by id 'continue'
And I click on the element located by id 'finish'
And I save the text of the element located by xpath '//h2[@class="complete-header"]' to the variable 'thankYouMessage'
And I initialize the variable 'expectedMessage' with the value '#{loadResource(data/message.txt)}'
Then the variable 'thankYouMessage' is equal to '#{eval(expectedMessage)}'
