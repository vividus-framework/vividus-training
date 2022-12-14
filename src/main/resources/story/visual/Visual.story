Narrative:
This story used to show visual testing type, provided by 'vividus-plugin-visual'
Firstly, reference image should be created (1st scenario),
then reference image will be compared with actual page (2nd scenario)
Story failure is expected to provide an example of visual comparison in Allure report

Meta:
   @visual

Scenario: Login
Given I am on the main application page
When I login in the web application with `${default-user}` and `${default-user-password}`

Scenario: Create baseline
When I ESTABLISH baseline with name `reference-image` ignoring:
|ELEMENT     |
|tagName(img)|

Scenario: Validate against baseline
When I click on element located `id(add-to-cart-sauce-labs-backpack)`
When I click on element located `id(add-to-cart-sauce-labs-fleece-jacket)`
When I COMPARE_AGAINST baseline with name `reference-image` ignoring:
|ELEMENT     |
|tagName(img)|
