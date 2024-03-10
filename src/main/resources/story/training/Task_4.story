Scenario: Navigate to the website homepage
Given I am on main application page
When I take screenshot of Homepage
When I ${baselineAction} baseline with name `loginPage` ignoring:
|ACCEPTABLE_DIFF_PERCENTAGE|
|5                         |

Scenario: Log in as a Good User
When I login with ${userName} and ${password}
When I wait until element located by `xpath(//*[@id="header_container"]/div[1]/div[2]/div)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements found by `className(inventory_item)` is equal to `6`
When I ${baselineAction} baseline with name `homepage` ignoring:
|ELEMENT                                   |ACCEPTABLE_DIFF_PERCENTAGE|
|By.xpath(//*[@class='inventory_item_img'])|20                        |
