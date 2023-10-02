# <img src="https://github.com/arnav1776/Code-Warriors/blob/master/android/app/src/main/res/mipmap-hdpi/ic_launcher.png?raw=true" alt="icon" width=30> Routinger

This is a simple app that will allow you to schedule your tasks, create a simple to-do list, and make recurring tasks. The app can also send you notifications to remind you of your tasks. The app as of now works on stored data in local storage only. It is meant to be a cross platform app.

<p align="center">
<img width="28%" src="https://raw.githubusercontent.com/arnav1776/routinger/master/dev_assets/new-splash-icon.png">
</p>

We are constantly updating our application with the help of our contributors. Feel free to open an `issue` if you face any problem or would like to add any new feature.

<p align="center">
<b>Old Look &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; New Look </b>
<p align="center"> 
<img src="https://user-images.githubusercontent.com/64467851/135705606-47baea3a-bcde-44ca-9a9f-016316ad06eb.jpg" width="300" height="500">  
<img src="https://user-images.githubusercontent.com/64467851/135705368-9006d4be-8a7b-445c-b894-9c5a0bcb79aa.jpg" width="300" height="500">
</p> 
</p>

>If you want to try out the app you can find the link to the app [here](https://github.com/Routinger/routinger/releases). The current app version is in early development and there may be errors. **We recommend trying it out and telling us about your opinions in the 'issues', or you can email to us.** We will soon also make a discussions page.

## List of Contents

[<img src="https://github.com/arnav1776/Code-Warriors/blob/master/android/app/src/main/res/mipmap-hdpi/ic_launcher.png?raw=true" alt="icon" width=30> Routinger](#-routinger)
  - [List of Contents](#list-of-contents)
  - [Preview](#preview)
  - [Dependencies](#dependencies)
  - [Installation](#installation)
  - [Getting Started with the Project](#getting-started-with-the-project)
  - [Info](#info)

## App Preview

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

- Fork and clone the repository onto your system.
- Install the dependencies.
- Install the latest versions of "Flutter" and "Android Studio".
- Run ```flutter pub get```.
- Run the application.

Make sure `Flutter` and `Android Studio` are installed properly before running the app. Any code editor is valid for running and developing the app. Follow these steps:
1. Navigate to the forked repo in your code editor and terminal


2. Use either the "debug and run" command or "continue without debugging"

OR

2. Run the program in the terminal after navigating to the root of folder with

`flutter run`

You can run it in an emulator, or with a real android device after turning on USB-Debugging. Your editor will be able to help you select what platform you want to run from multiple devices.

## Getting Started with the Project

After completing the installation, locate the `lib` folder in the project. This contains all the code files where you can make your contributions.<br>
> Lib Folder
- The `main.dart` file is the entry point of the application, which is responsible for executing all library functions, user-defined statements, etc.
- The `screens` folder contains all the screens which will be displayed in the application.
- You can find the widgets in the `widgets` folder which are used to make the app interactive.

> Assets Folder
- Add your images & fonts here after adding it in `pubspec.yaml` file.

> For Android, iOS, & Web
- Make changes in the `Android`, `ios`, & `web` folder based on where you want to launch it.

> General Folder Structure

The general structure of the project is as follows:
- [Helper Directory](https://github.com/Routinger/routinger/tree/master/lib/helper): Where database-related functions are located, along with a `list_of_notif model` used by the app.
- [Provider Directory](https://github.com/Routinger/routinger/tree/master/lib/provider): All providers listened to by the app are in the provider directory. This includes the "task provider" and "tasks provider":
  1. Task Provider: Contains specific details for one task.
  2. Tasks Provider: Contains a list of tasks and handles the functions for adding, removing, and saving to local storage.
- [Screens Directory](https://github.com/Routinger/routinger/tree/master/lib/screens): Currently the app has two screens, which are present in the screens directory. The first one is the home screen, and the second is the "add task" screen.
- [Services Directory](https://github.com/Routinger/routinger/tree/master/lib/services): Logic for the notification services are present in the notifications file.  The sleep cycle manages user data relating to wake-up time and sleep time to allow for nonredundant notifications and timely delivery based on a user's time while awake.
- [Widgets Directory](https://github.com/Routinger/routinger/tree/master/lib/widgets): Where all of the presentation logic for the app is located. Everything visible on-screen has been made into different widget files with respective directories for easier debugging. The individual directories are as follows:
  1. [Add_task Directory](https://github.com/Routinger/routinger/tree/master/lib/widgets/add_task): Where the widgets for the add_task screen are located. Most contributions to this screen will be in this directory.
  2. [Home Directory](https://github.com/Routinger/routinger/tree/master/lib/widgets/home): Where the widgets for the home screen are. Due to the home directory being where most of the app's actions are, it has been subdivided into `stats` and `taskslist`:
     - [Stats Directory](https://github.com/Routinger/routinger/tree/master/lib/widgets/home/stats): Where stats-related widgets are located. These include the stats chart and the stats card.
     - [Taskslist Directory](https://github.com/Routinger/routinger/tree/master/lib/widgets/home/taskslist): Where the widgets for tasklist are located. These include the tasklist's individual cards and the tasklist parent.
  3. [Settings Directory](https://github.com/Routinger/routinger/tree/master/lib/widgets/settings): Where all of the widgets for the settings screens are located.
- The `main.dart` file is kept cluttered free. This should be only changed when absolutely necessary, such as when adding a new provider.

## Info

**We have not yet tested the app in the iOS platform, and it may not work completely in iOS emulators and/or iOS devices. If you want to contribute the iOS side of the app, you are more than welcome to do so.** 

Check the [Contributions](https://github.com/Kushalrock/routinger/blob/master/CONTRIBUTING.md) guideline before contributing to make sure you are contributing the rightway.

**Be sure to follow the [Code Of Conduct](https://github.com/Kushalrock/routinger/blob/master/CODE_OF_CONDUCT.md) at all times.** 

Being part of a community means there are certain simple rules and etiquettes that needs to be followed. Following these simple rules makes everyone feel like they are a part of community and are not being mistreated. 

Have a good day.