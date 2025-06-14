GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Good User
Given I am on main application page
When I enter `standard_user` in field located by `xpath(//input[@id="user-name"])`
And I enter `secret_sauce` in field located by `xpath(//input[@id="password"])`
And I click on element located by `xpath(//input[@id="login-button"])`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements found by `xpath(//div[@class="inventory_item"])` is equal to `6`
