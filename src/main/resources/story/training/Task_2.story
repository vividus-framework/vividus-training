GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Good User
Given I am on main application page
When I enter `${swagGoodUserName}` in field located `xpath(//input[@id="user-name"])` using keyboard
When I enter `${swagPassword}` in field located `xpath(//input[@id="password"])` using keyboard
When I click on a button with the name 'Login'
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I wait until element located by `caseSensitiveText(Sauce Labs Backpack)` appears  
Then text `Sauce Labs Backpack` exists
Then number of elements found by `className(inventory_item)` is EQUAL_TO `6`  
When I take screenshot
