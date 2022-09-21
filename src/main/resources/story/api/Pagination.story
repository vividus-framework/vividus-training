Narrative:
This story is designed to validate REST web-service with 'vividus-plugin-rest-api'
VIVIDUS features:
line 20: compare actual value from response with global variable stored in property file
line 26: usage of condition step. If number of palette entities more than 1 - sub-steps placed in table will be executed
line 37: example table with dynamic values calculation, based on actual service response in the first scenario

Meta:
    @api
    @feature 13

Scenario: Defaul pagination
Meta:
    @testCaseId 7
    @smoke
When I send HTTP GET to the relative URL '/palette'
Then `${responseCode}` is equal to `200`
Then JSON element value from context by JSON path `$.page` equal to `1`
Then JSON element value from context by JSON path `$.per_page` equal to `${default-page-size}`
When I save JSON element value from context by JSON path `$.total` to STORY variable `palette-total-count`
Then number of JSON elements by JSON path `$.data` is <= ${default-page-size}

Scenario: Validate pagination parameters
Meta:
    @testCaseId 8
When the condition '#{eval(${palette-total-count} > 1)}' is true I do
|step                                                                 |
|When I send HTTP GET to the relative URL '/palette?<query>'          |
|Then JSON element by JSON path `$` is equal to `                     |
|{                                                                    |
|    "page": <page>,                                                  |
|    "per_page": <per_page>,                                          |
|    "total_pages": <total_pages>                                     |
|}                                                                    |
|`ignoring extra fields                                               |
|Then number of JSON elements by JSON path `$.data` is = <data_count> |
Examples:
|per_page                            |page|total_pages            |query                                               |data_count             |
|#{eval(${palette-total-count} - 1)} |2   |2                      |per_page=#{eval(${palette-total-count} - 1)}&page=2 |1                      |
|${palette-total-count}              |1   |1                      |per_page=${palette-total-count}                     |${palette-total-count} |
|1                                   |1   |${palette-total-count} |per_page=1                                          |1                      |
