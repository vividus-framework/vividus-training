# VIVIDUS Training: Practice Part 4

## Perform a Visual Check

1. In your local repo switch to branch "04_task_Visual_Check " and continue your work in it.

1. Rename the `/properties/environment/saucedemo` package to the `/properties/environment/saucedemo_{yourSurname}` (e.g.  "saucedemo_Ivanov"). Then update the environment reference in the `configuration.properties` file to match the new package name.

1. Meet the following preconditions:

    - Put your scenarios into the `Task_4.story` file.

    - Use the `vividus-plugin-visual` plug-in, which is already added to the `build.gradle` file.

    - Configure your local setup using the baselines package located in the `src/main/resources` folder:

    - Open the `overriding.properties` file and set the `ui.visual.baseline-storage.filesystem.folder` property to the absolute path of the baselines package on your machine.

   For example, on macOS it may look like:

   `ui.visual.baseline-storage.filesystem.folder=/Users/[user_name]/Documents/Repos/[project_name]/src/main/resources/baselines` <br />

   On Windows it may look like :

   `ui.visual.baseline-storage.filesystem.folder=C:/Users/[user_name]/Repos/[project_name]/src/main/resources/baselines` <br />



   - In your `environment.properties` file, set the global variable `variables.baselineAction=COMPARE_AGAINST`. This will be your default visual testing action.

1. Add two visual checks to your existing test script from Task 3:

    - 4.1 In the "Navigate to the website homepage" scenario, add a visual check of the entire page (before entering the credentials) with the parameter `ACCEPTABLE_DIFF_PERCENTAGE == 5`. <br />

    - 4.2 In the "Log in as a User" scenario, add a visual check of the /inventory page while ignoring elements with the XPath //*[@class='inventory_item_img']//. <br />

1. Run the story as the "good" user with `variables.baselineAction=ESTABLISH`. Make sure that the baseline screenshots are successfully added to the baselines package.

1. Rerun the story as the "broken" user with the parameter `variables.baselineAction=COMPARE_AGAINST`. Note that the visual check result for the /inventory page should be "passed", as the pages are identical for the "good" and "broken" users, except for the inventory item images. If there are any additional differences, you can adjust the `ACCEPTABLE_DIFF_PERCENTAGE` parameter to see the changes.

1. Zip the second Allure report that contains the comparison result, and then upload the zipped file to the designated practical task page in the course. Your mentor will review it once you submit all the tasks.

1. Once the task is completed, make sure to commit all your local changes with commit message "{yourSurname}" to your current local branch.
