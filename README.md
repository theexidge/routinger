# Routinger

This is a simple app that will allow you to schedule your tasks, create a simple to-do, and also make recurring tasks. The app ends you notifications to remind you of your taks. The app as of now works on storing data on local storage only. It is meant to be a cross platform app.

## Folder Structure

The general structure of the project is as follows-:
- [Helper Directory](https://github.com/Routinger/routinger/tree/master/lib/helper) :- All the database related functions are located in the helper directory along with a list_of_notif model used by Rountinger.
- [Provider Directory](https://github.com/Routinger/routinger/tree/master/lib/provider) :- All the provider which app listens to is in the provider directory. This includes the task and tasks provider. The task provider is specific and contains the details for one task. While the tasks provider contains a list of tasks and handles the adding, removing, saving to local storage functions.
- [Screens Directory](https://github.com/Routinger/routinger/tree/master/lib/screens) :- Currently the app has two screens, which are present in the screens directory. The first one is the home screen and other is a add task screen.
- [Services Directory](https://github.com/Routinger/routinger/tree/master/lib/services) :- All the code related to notification services are present in notifications file. While the sleep cycle manages the user sleep cycle storing the wake up time and sleep time to not show recurring notifications during the tme user sleeps.
- [Widgets directory](https://github.com/Routinger/routinger/tree/master/lib/widgets) :- All the presentation logic is present in the widgets directory. Every thing that you see on screen has been made into a different widget file for easier debugging.
- The main.dart file is kept cluttered free. This should be only changed when absolutely necessary like when providing a new provider.

## Getting Started
>If you want to try out the app you can find the link to the app [here](https://github.com/Routinger/routinger/releases). The current app version is very early and there may be errors. **We recommend trying it out and telling us about your opinions in the issues or you can email to us.** We will soon also make a discussions page.

Make sure flutter and android studio is installed properly in your system. Fork the repo. We use VS Code as our code-editor. But any code-editor is fine. Follow these steps-:
1. Navigating to the forked repo in your code-editor and terminal


2. Using either the debug and run command or continue without debugging

OR

2. In terminal after navigating to the root of folder

`flutter run`

You can run it in an emulator or use your real android device and turn the USB-Debugging on.  Your editor will be able to help you select what platform you want to run from multiple devices.

## Info

**We haven't yet tested the app in iOS platform and it mayn't work completely in iOS emulators and/or iOS devices. If you want to contribute the iOS side of the app. You are more than welcome to do so.** 


Check the [Contributions](https://github.com/Kushalrock/routinger/blob/master/CONTRIBUTING.md) guideline before contributing to make sure you are contributing the rightway.

**Be sure to follow the [Code Of Conduct](https://github.com/Kushalrock/routinger/blob/master/CODE_OF_CONDUCT.md) at all times.** 

Being part of a community means there are certain simple rules and etiquettes that needs to be followed. Following these simple rules makes everyone feel like they are a part of community and are not being mistreated. 

Have a good day.
