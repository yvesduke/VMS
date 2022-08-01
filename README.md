# VMS

#### Intro :
This is a small app taht allows VM staff to see and use all their collegues contact details. 
the app also allows users to see which rooms in the office are currently occupied.


#### Quick start :
Using either a real device or simulato, lunch the app and you will be presented with a list of VM staff with their phots, Name and email address.
at the bottom of the window, you will have two tabs one for VM staff and another for the room. You can switch between these two tabs depending on 
what you want to see. If you click on one of the staff member in a list, you will be presented with a detail page containing staff image, first, last name, email, job title and favourite color.
The room view will show a list of rooms with each room's id and its occupancy status.

#### Status :
The app is currently using storyboard for with UIKIT to create user Interface. It is build using MVVM architecture, with Testcases. 
The app currenlty support different ios screen sizes and targets ios 15


#### What's included :
 - 2 models, One for colleague and another one for room
 - 2 ViewModels: one for ColleguesListViewModel and one for RoomsViewModel
 - Cells for Collegue, and rooms to allow us to display a list of these data
 - a constant to hold our endpoint
 - utility class to allow us to perform our service calls
 - MockUrlSessin and an APImanagerTest to test our service calls
 - We also have viewModelTests files to allow us to test our viewModels


#### Features :
 - Display a list of VM Staff with image and contact info,
 - Display a list of VM rooms with their Id, and Occupancy status
 - Click on any user to display a detail view of that specific user
 - tabbar to switch between staff and room
