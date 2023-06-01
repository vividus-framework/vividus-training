Narrative:
In this story you can find STORY level example table,
that means that all scenarios in this story will be executed number of times equals rows count from table with provided parameters

Another feature is usage SCENARIO level examples based on values from excel file (line 29),
to have such possibility you need to add 'vividus-plugin-excel' to your test project

Meta:
    @regression

Lifecycle:
Examples:
|username                |password                 |
|${default-user}         |${default-user-password} |
|performance_glitch_user |secret_sauce             |

Scenario: Login
Given I am on the main application page
When I login in the web application with `<username>` and `<password>`

Scenario: Validate available products
Meta:
    @testCaseId 5
When I change context to element located `productItemByName(<name>)`
Then number of elements found by `xpath(//img[contains(@src, 'static/media/<image-file>')])` is = `1`
Then the text '<description>' exists
Then number of elements found by `caseSensitiveText(${currency}<price>)` is = `1`
Examples:
{transformer=FROM_EXCEL, path=/story/testdata/products.xlsx, sheet=Sheet1, range=C1:F3}
