Narrative:
This story is designed to validate REST web-service with 'vividus-plugin-rest-api'
Here you can find an example of table transformers usage:
First transformer uploads data from CSV file
Second merge CSV data with data from scenario example table (rows 30, 31)
Third transformer sort values by the registration date

At line 30 you can find an example of validation of response value by RegEx pattern.

Another interesting feature is generation of current date by #{generateDate(P)} expression (line 29).
This functionality provided by 'vividus-plugin-datetime'

Meta:
    @api
    @feature 9

Scenario: Upload Palette sorted by registration year
Meta:
    @testCaseId 8
Given request body:
{
    "name" : "<name>",
    "year" : "<registered>",
    "color" : "<color_code>",
    "pantone_value" : "<pantone>"
}
When I send HTTP POST to the relative URL '/users'
Then `${responseCode}` is equal to `201`
Then JSON element value from context by JSON path `$.id` matches `\d+`
Then JSON element value from context by JSON path `$.createdAt` contains `#{generateDate(P)}`
Examples:
{transformer=MERGING, mergeMode=rows, tables=\{transformer=FROM_CSV\, csvPath=/story/testdata/palette.csv\}}
{transformer=SORTING, byColumns=registered}
|name      |registered |color_code |pantone |
|tigerlily |2004       |#E2583E    |17-1456 |
