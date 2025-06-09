Scenario: Login and Validate Inventory
Given I am on main application page
When I enter `${swagGoodUserName}` in field located by `xpath(.//input[@id='user-name'])`
When I enter `${swagPassword}` in field located by `xpath(.//input[@id='password'])`
When I click on element located by `xpath(.//input[@id='login-button'])`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements found by `xpath(//div[@data-test='inventory-item-name'])` is equal to `6`
When I take screenshot