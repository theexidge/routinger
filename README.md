# <img src="https://github.com/arnav1776/Code-Warriors/blob/master/android/app/src/main/res/mipmap-hdpi/ic_launcher.png?raw=true" alt="icon" width=30> Routinger

This is a simple app that will allow you to schedule your tasks, create a simple to-do, and also make recurring tasks. The app ends you notifications to remind you of your tasks. The app as of now works on storing data on local storage only. It is meant to be a cross platform app.

<p align="center">
<img width="28%" src="https://raw.githubusercontent.com/arnav1776/routinger/master/dev_assets/new-splash-icon.png">
</p>

We are constantly updating our application with the help of our contributors and feel free to open an `issue` if you face any problem or would like to add any new feature.

<p align="center">
<b>Old Look &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; New Look </b>
<p align="center"> 
<img src="https://user-images.githubusercontent.com/64467851/135705606-47baea3a-bcde-44ca-9a9f-016316ad06eb.jpg" width="300" height="500">  
<img src="https://user-images.githubusercontent.com/64467851/135705368-9006d4be-8a7b-445c-b894-9c5a0bcb79aa.jpg" width="300" height="500">
</p> 
</p>

>If you want to try out the app you can find the link to the app [here](https://github.com/Routinger/routinger/releases). The current app version is very early and there may be errors. **We recommend trying it out and telling us about your opinions in the issues or you can email to us.** We will soon also make a discussions page.

## List of Contents

- [<img src="https://github.com/arnav1776/Code-Warriors/blob/master/android/app/src/main/res/mipmap-hdpi/ic_launcher.png?raw=true" alt="icon" width=30> Routinger](#-routinger)
  - [List of Contents](#list-of-contents)
  - [Preview](#preview)
  - [Dependencies](#dependencies)
  - [Installation](#installation)
  - [Getting Started with the project](#getting-started-with-the-project)
  - [Info](#info)

## Preview

**Screens**!!

| ![image](https://user-images.githubusercontent.com/64467851/135705368-9006d4be-8a7b-445c-b894-9c5a0bcb79aa.jpg) | ![image](https://user-images.githubusercontent.com/64467851/135705406-06716452-f7f9-487f-b323-2464c7ed6b40.jpg) | ![image](https://user-images.githubusercontent.com/64467851/135705888-2d7843b8-e6c2-4af5-beb2-d6746d4b9b27.jpg) |  
| :-------------: | :-------------:  | :-------------:  | 
|     Home Screen     |    Your Stats    |    Splash Screen    |       

| ![image](https://user-images.githubusercontent.com/64467851/135705501-65013a03-97d5-4549-8598-a82381d3fb95.jpg)| ![image](https://user-images.githubusercontent.com/64467851/135705481-98f7181b-5815-459e-a6a0-305afc1935bd.jpg) | ![image](https://user-images.githubusercontent.com/64467851/135705462-3bd9526d-05d4-4907-ad34-36d1b582a7cd.jpg) | 
| :-------------:  | :-------------:  | :-------------:  | 
|    Add Tasks     |    Set Timer     |    Toggle Dark Mode      |

## Dependencies

The following packages are needed for the development of this application.
 - `cupertino_icons: ^1.0.2`
 - `provider: ^6.0.0`
 - `card_swiper: ^1.0.4`
 - `flutter_local_notifications: ^8.1.1+1`
 - `intl: ^0.17.0`
 - `flutter_native_timezone: ^2.0.0`
 - `sqflite: ^2.0.0+4`
 - `url_launcher: ^6.0.9`
 - `mdi: ^5.0.0-nullsafety.0`
 - `fl_chart: ^0.40.0`
 - `flutter_launcher_icons: ^0.9.2`
 - `flutter_native_splash: ^1.2.4`

More details about these can be found in the [`pubspec.yaml`](https://github.com/Routinger/routinger/tree/master/pubspec.yaml) file.

## Installation

- Clone the repository on your system.
- Install the dependencies
- Run ```flutter pub get```
- Run the application

Make sure flutter and android studio is installed properly in your system. Fork the repo. We use VS Code as our code-editor. But any code-editor is fine. Follow these steps-:
1. Navigating to the forked repo in your code-editor and terminal


2. Using either the debug and run command or continue without debugging

OR

2. In terminal after navigating to the root of folder

`flutter run`

You can run it in an emulator or use your real android device and turn the USB-Debugging on.  Your editor will be able to help you select what platform you want to run from multiple devices.

## Getting Started with the project


After completing the installation locate the `lib` folder in the project which contains all the code files where you can make your contributions.<br>
> In the lib folder
- The `main.dart` file is the entry point of the application which is responsible for executing all library functions, user-defined statements etc.
- The `screens` folder contains all the screens which will be displayed in the application.
- You can find the widgets in the `widgets` folder which are used to make the app interactive.

> Assets Folder
- Add your images & fonts here after adding it in `pubspec.yaml` file.

> For Android, Ios & web
- Make changes in `Android`, `ios` & `web` folder based on where you want to launch it.


> Folder-Structure

The general structure of the project is as follows-:
- [Helper Directory](https://github.com/Routinger/routinger/tree/master/lib/helper) :- All the database related functions are located in the helper directory along with a list_of_notif model used by Rountinger.
- [Provider Directory](https://github.com/Routinger/routinger/tree/master/lib/provider) :- All the provider which app listens to is in the provider directory. This includes the task and tasks provider. The task provider is specific and contains the details for one task. While the tasks provider contains a list of tasks and handles the adding, removing, saving to local storage functions.
- [Screens Directory](https://github.com/Routinger/routinger/tree/master/lib/screens) :- Currently the app has two screens, which are present in the screens directory. The first one is the home screen and other is a add task screen.
- [Services Directory](https://github.com/Routinger/routinger/tree/master/lib/services) :- All the code related to notification services are present in notifications file. While the sleep cycle manages the user sleep cycle storing the wake up time and sleep time to not show recurring notifications during the tme user sleeps.
- [Widgets Directory](https://github.com/Routinger/routinger/tree/master/lib/widgets) :- All the presentation logic is present in the widgets directory. Every thing that you see on screen has been made into a different widget file for easier debugging. The widget directory is re-classified into three other directories according to the screens. They are-:
  1. [Add_task Directory](https://github.com/Routinger/routinger/tree/master/lib/widgets/add_task) -: All the widgets which go into the add_task screen is kept here. If you are contributing something to the add_task screen most of yur work will be in this directory.
  2. [Home Directory](https://github.com/Routinger/routinger/tree/master/lib/widgets/home) - All the widgets which are in the home screen comes here. Home screen is where most of the action takles place. Thus it has been subdivided into stats and taskslist.
     - [Stats Directory](https://github.com/Routinger/routinger/tree/master/lib/widgets/home/stats) - All the stats related widgets such as the stats chart and the stats card are here.
     - [Taskslist Directory](https://github.com/Routinger/routinger/tree/master/lib/widgets/home/taskslist) - All the widgets of taskslist including the individual cards are kept in here. Also, the taskslist parent itself.
  3. [Settings Directory](https://github.com/Routinger/routinger/tree/master/lib/widgets/settings) - Settings Directory contains all the widgets which are used in the settings screen.
- The `main.dart` file is kept cluttered free. This should be only changed when absolutely necessary like when providing a new provider.


## Info

**We haven't yet tested the app in iOS platform and it mayn't work completely in iOS emulators and/or iOS devices. If you want to contribute the iOS side of the app. You are more than welcome to do so.** 


Check the [Contributions](https://github.com/Kushalrock/routinger/blob/master/CONTRIBUTING.md) guideline before contributing to make sure you are contributing the rightway.

**Be sure to follow the [Code Of Conduct](https://github.com/Kushalrock/routinger/blob/master/CODE_OF_CONDUCT.md) at all times.** 

Being part of a community means there are certain simple rules and etiquettes that needs to be followed. Following these simple rules makes everyone feel like they are a part of community and are not being mistreated. 

Have a good day.
