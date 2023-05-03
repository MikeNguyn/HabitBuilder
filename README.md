# HABIT GARDEN PROJECT
--------------
![logo](./Practice/Practice/Assets.xcassets/AppIcon.appiconset/logoSQUARE.png)



## What did we build?
* A Garden-themed Habit App to help people "plant" and "nuture" their good habits.
* We built this phone app for people interested in building better habits and self-improvement.
* App was built using SwiftUI and Xcode.


## USER MANUAL
--------------
* Our Habit Garden app is only available for iPhones. Upon opening, users will be loaded onto the mainscreen (ContentView) where they will see a plot of land and 9 trowels. These trowels are clickable and allow us to add new habits to the garden plot. 
* When a trowel is clicked, users will be asked to enter in habit information and will be able to choose a plant to represent their habit.
* Plants that are currently in the garden can be long-pressed to check off a habit for the day. This will be signified by a green glow. If a habit is mistakenly checked off, another long-press will uncheck the habit.
* A simply tap of a plant will display a view with details of the habit. It will also show a calendar log of the past month and how many check-ins have occurred. 
* On this details page we can also check/uncheck habits. The progress bar shows how close the user is to fully growing the habit and reaching the final, full-grown plant.
* On the bottom of the details page are two buttons. We can edit a habit's attributes or delete a habit.
* Back to the home garden page, on the bottom left is a (?) Button where we can access the tutorial slideshow.
* The bottom right of the garden page opens up a small settings page where users can clear the entire garden or open their notification settings.


## UNDERSTANDING THE CODE
--------------

### Models
* Habit Data Class
    + Our Habit data class holds the attributes each habit needs such as name, plant, start & end date, frequency, etc.
* Plant Class
    + We created a Plant class that is mainly used to associate a plant's name and image stage together. This is helpful for keeping track of plant image growth for each habit.
* HabitStore
    + This class's function is for the saving and loading of our habit list data into a url. So whenever we close out of the app, our data is saved for the next load.
* QuoteManager
    + This model helps read in the quotes textfile that will be used to display new quotes daily on ContentView.

### Views
* ContentView
    + This view is the main homepage of the Habit Garden App. Displayed on the page is a 3x3 garden plot where habits can be grown and created. There are also tutorial and reset garden buttons which can help the user understand and/or reset the app.
* ImageSlideShow
    + This custom view displays the tutorial for our app's functionality. It automatically scrolls at a readable pace, but also has arrows to allow the user to understand the instructions at their own pace.
* AddView
    + This view is opened when a user clicks on a trowel to create a new habit. This view will allow the users to insert their habit's details such as frequency, name, plant choice, end date, and importance.
* DetailsView
    + The details view is accessed when a user click's on an existing habit's plant image. This view shows the details of a habit such as the log of checked-in dates, importance, plant image, etc.
* EditView
    + This view is accessed through the 'Edit' button in Details View. When accessed, EditView lets the user edit their habit's name, importance, and plant choice.
* ButtonView
    + This view is mainly used to display our custom plant images as clickable buttons. This view handles all the habit button interactions such as a normal tap (-> detail view) or a long-press (checking-off a habit).
* EmptyView
    + This view displays the trowel/shovel when there is not an existing habit in the garden slot. When clicked upon, this empty view will signal addview to start the creation of a habit.
* QuotesView
    + This view displays the text pulled from the quotes text file onto the main home page.


## Custom Assets
--------------
* all plants were made in illustrator by Curran and Francesca
--------------
![sunflower](./ReadmeImages/SunflowerReadme1.png)
![corn](./ReadmeImages/CornReadme1.png)
![tomato](./ReadmeImages/TomatoReadme1.png)
![blueberry](./ReadmeImages/BlueberryReadme1.png)
![pea](./ReadmeImages/PeaReadme1.png)
![orchid](./ReadmeImages/OrchidReadme1.png)
![trowel](./ReadmeImages/TrowelReadme1.png)



## CREDITS
--------------
* made by Curran Middleton, Matthew Mukai, Michael Nguyen, Francesca Brown
* made for people interested in building better habits and self-improvement

