Scenario: Navigate to the website homepage
When I open main application page
When I COMPARE_AGAINST baseline with name `loginPage` ignoring:
|ACCEPTABLE_DIFF_PERCENTAGE|
|5                         |


Scenario: Log in as a User
When I login with ${userName} and ${password}
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements found by `By.xpath(//*[@class='inventory_item'])` is EQUAL_TO `6`
When I COMPARE_AGAINST baseline with name `homepage` ignoring:
|ELEMENT                                   |ACCEPTABLE_DIFF_PERCENTAGE|
|By.xpath(//*[@class='inventory_item_img'])|9                         |
