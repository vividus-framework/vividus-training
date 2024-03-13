GivenStories: story/demo/Homepage_Demo.story
Scenario: Log in as a Good User
Given I am on main application page
When I wait until element located by `id(user-name)` appears
When I enter `standard_user` in field located by `id(user-name)`
When I enter `secret_sauce` in field located by `id(password)`
When I click on element located by `id(login-button)`
Then the page with the URL 'https://www.saucedemo.com/inventory.html' is loaded
Then number of elements found by `By.CssSelector(.inventory_item)` is equal to `6`
When I take screenshot