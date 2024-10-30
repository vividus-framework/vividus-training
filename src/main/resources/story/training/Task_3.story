Scenario: Navigate to the website homepage
When I open main application page


Scenario: Log in as a Good User
When I login with ${userName} and ${password}
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I take screenshot
