# Order App

A new Flutter project.

# Code Structure
## src folder
This folder root folder for all flutter code

### bloc folder
This folder contains the bloc class. 
Bloc class is a class that will seperate business logic from the UI. 
It contains all the operations which receive from user.

### model folder
This folder contains simple model class.

### pages folder
This folder contains all classes that represent the screen of the app.
Ex: Customer

### services folder
This folder contains all classes that provider services for application
- AppDb class responsible for database structure in app
- DbService class contains all operation related to Database (CRUD)

### main.dart file
This is the entry point for kick start the application
