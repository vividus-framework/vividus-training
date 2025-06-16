Lifecycle:
Examples:
|swaguserName	         |password	    |
|performance_glitch_user |secret_sauce	|
|standard_user           |secret_sauce	|


Scenario: 4.1,4.2 Add item to the shopping cart
When Navigate to the SauceDemo website homepage
When I fill <swaguserName>,<password> to saucedemo website
Then number of elements found by `xpath(//*[contains(text(),'<itemName>')])` is equal to `1`
When I click on element located by `id(react-burger-menu-btn)`
When I click on element located by `linkText(Reset App State)`
When I click on element located by `<addToCartButtonId>`


Examples:
|itemName                    |itemPageId |addToCartButtonId                      |
|Sauce Labs Backpack         |           |id(add-to-cart-sauce-labs-backpack)    |

Scenario: 4.3,4.4 Populate checkout data
Given I initialize story variable `testFirstName` with value `#{generate(regexify '[A-Z][a-z]{10}')}` 
Given I initialize story variable `testLastName` with value `#{generate(regexify '[A-Z][a-z]{10}')}` 
Given I initialize story variable `postalCode` with value `#{generate(regexify '[A-Z]{3}-[1-9]{5}')}` 
Given I initialize story variable `testFirstNamelUp` with value `#{toUppercase(${testFirstName})}` 
Given I initialize story variable `testFirstNamelLo` with value `#{toLowercase(${testFirstName})}` 

When Navigate to the SauceDemo website homepage
When I fill <swaguserName>,<password> to saucedemo website

When I click on element located by `linkText(shopping-cart-link)`
When I click on element located by `id(checkout)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-step-one.html`
 

When I enter `${testFirstName}` in field located by `id(first-name)`
When I enter `${testLastName}` in field located by `id(last-name)`
When I enter `${postalCode}` in field located by `id(postal-code)`
When I take screenshot

When I click on element located by `id(continue)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-step-two.html`

When I click on element located by `id(finish)`
Given I initialize story variable `html` with value
`
<h2 class="complete-header" data-test="complete-header">Thank you for your order!</h2>
`
When I save text of element located by `tagName(h2)` to scenario variable `text`

Then `${text}` is equal to `Thank you for your order!`
Given I initialize scenario variable `mydata` with value `#{loadResource(/data/message.txt)}`

Then `#{eval(text)}` is equal to `#{eval(mydata)}`

Examples:
|locatorType  |header|
|XPath        |//h2  |