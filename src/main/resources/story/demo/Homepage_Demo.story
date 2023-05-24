Meta:
    @group Training
    @demo
    @requirementId REQ-0001

Scenario: Navigate to the SauceDemo website homepage
Given I am on the main application page
When I wait until the page has the title 'Swag Labs'
Then the page with the URL 'https://www.saucedemo.com/' is loaded
When I take screenshot
