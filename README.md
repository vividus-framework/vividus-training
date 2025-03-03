# VIVIDUS Training: Practice Part 6

## Use Example Tables

1. In your local repo switch to branch "06_task_Example_Tables" and continue your work in it.

1. Rename the `/properties/environment/saucedemo` package to the `/properties/environment/saucedemo_{yourSurname}` (e.g.  "saucedemo_Ivanov"). Then update the environment reference in the configuration.properties file to match the new package name.

1. Put your scenarios into the `Task_6.story` file.

1. Practice using example tables at both the story and scenario levels: <br />

    - 4.1 In your "Log In" scenario, use the provided credentials from the story-level example table. It contains two datasets: one for "good" users and another for "slow" users. <br />

    - 4.2 In your "Add item to the shopping cart" scenario, add at least three items to the shopping cart. Implement a scenario-level example table that includes the parameters: `itemName`, `itemPageId`, and `addToCartButtonId`. Make sure to use all of them in your scenario. <br />

    - 4.3 In your "Validate the number of items in the shopping cart" scenario, validate the number of items added to the shopping cart. <br />

    - 4.4 In the "Log Out" scenario, reset the application state and log out. You can do this by clicking the "Reset App State" and "Logout" links in the left-side navigation menu. <br />

1. Run the resulting story on your local machine using the configuration set in the `suite.training` file. If needed, you can adjust the execution scope by modifying the overriding.properties file. <br />

1. Zip the second Allure report that contains the comparison result, and then upload the zipped file to the designated practical task page in the course. Your mentor will review it once you submit all the tasks.

1. As an additional challenge, try running your story for the remaining users mentioned in the environment.properties file. <br />

    Review the resulting Allure reports. <br />

    Pay attention to the places where @group and @requirementId meta tags are mentioned. For more information on available meta tags and how to use them, refer to the [VIVIDUS docs portal](https://docs.vividus.dev/vividus/latest/configuration/tests-configuration.html#_meta_tags).

1. Once the task is completed, make sure to commit all your local changes with commit message "{yourSurname}" to your current local branch.
