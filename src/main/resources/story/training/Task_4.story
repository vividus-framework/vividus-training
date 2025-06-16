
Scenario: Log in as a Good User
When Navigate to the SauceDemo website homepage
When I ESTABLISH baseline with name `loginPage`

Scenario: Log in as a good User
When Navigate to the SauceDemo website homepage
When I fill ${swagGoodUserName},${swagPassword} to saucedemo website
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements found by `xpath(//*[@class='inventory_item_description'])` is equal to `6`
When I COMPARE_AGAINST baseline with name `homepage` ignoring:
|ELEMENT                                   |ACCEPTABLE_DIFF_PERCENTAGE|
|By.xpath(//*[@class='inventory_item_img'])|30.478                    |

Scenario: Log in as a broken User
When Navigate to the SauceDemo website homepage
When I enter `${swagBrokenUserName}` in field located by `id(user-name)`
When I enter `${swagPassword}` in field located by `id(password)`
When I click on element located by `id(login-button)`
Then number of elements found by `xpath(//*[contains(text(),'Products')])` is equal to `1`
When I take screenshot
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements found by `xpath(//*[@class='inventory_item_description'])` is equal to `6`
When I COMPARE_AGAINST baseline with name `homepage` ignoring:
|ELEMENT                                   |ACCEPTABLE_DIFF_PERCENTAGE|
|By.xpath(//*[@class='inventory_item_img'])|30.477                    |


