
Scenario: Log in as a Locked User
When Navigate to the SauceDemo website homepage
When I enter `${swagLockedUserName}` in field located by `id(user-name)`
When I enter `${swagPassword}` in field located by `id(password)`
When I click on element located by `id(login-button)`
Then number of elements found by `xpath(//*[contains(text(),'Products')])` is equal to `1`
When I take screenshot
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`



