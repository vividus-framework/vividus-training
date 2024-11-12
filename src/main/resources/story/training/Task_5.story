Scenario: Navigate to the website homepage
When I open main application page

Scenario: Log in as Locked User
When I login with ${userName} and ${password}
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements found by `By.className(inventory_item)` is equal to `6`
