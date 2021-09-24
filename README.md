# Routinger

This is a simple app that will allow you to schedule your tasks, create a simple to-do, and also make recurring tasks. It is meant to be a cross platform app. Due to certain limitations it will be first released only for Android Users on Play Store under the organization name of "Codeluent", after resolving some problems it will be released to iOS store under the same developer/organization name.

The app released under the organization/devloper name "Codeluent" will be completely free of in-app purchases as of now and free of advertisements. It can however include a way to support the developers if you like.

The general structure of the project is as follows-:
- All the database related functions are located in the helper directory along with a list_of_notif model used by Rountinger.
- All the provider which app listens to is in the provider directory. This includes the task and tasks provider. The task provider is specific and contains the details for one task. While the tasks provider contains a list of tasks and handles the adding, removing, saving to local storage functions.
- Currently the app has two screens, which are present in the screens directory. The first one is the home screen and other is a add task screen.
- The services directory: All the code related to notification services are present in notifications file. While the sleep cycle manages the user sleep cycle storing the wake up time and sleep time to not show recurring notifications during the tme user sleeps.
- The widgets directory: All the presentation logic is present in the widgets directory. Every thing that you see on screen has been made into a different widget file for easier debugging.
- The main.dart file is kept cluttered free. 

With Regards  
Kushal A.
