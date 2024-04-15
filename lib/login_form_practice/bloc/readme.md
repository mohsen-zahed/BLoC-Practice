    ** In two used methods in this project (Cubit & BLoC). **

    Cubit: Cubit works using function that means everything that you want to do or changes that you want
    to apply occurs with creating that specific function. ex: if you want user to insert something and display it on screen you will have to create its
    function first

    there is a parent class (like in todo list practice: todo_cubit.dart) which involes the class that extends the Cubit main class and in its body you can
    implement your desired functions that can be later used in your app.

    BLoC: BLoC works based on events, it means whereever you want any changes in your app first of all you'll have to create its specific event
    in a file (ex: login-form-practice --> bloc/auth_bloc.dart). You can implement as many as events you need in your project in this file and use them
    later on in any screen.
    Just keep in mind by creating a bloc folder you'll have three main files (example-bloc.dart - example-event.dart - example-state.dart) along with folder.
    1- The first one is where you implement all your events. Contains events that are being triggered wheneever user causes any update in UI.
    2- The second one is where you implement all your event classes, all event classes should be extending one main event class (ex: login-form-practice-->
    bloc/auth_bloc.dart)
    3- The third one is where you implement all your possible states that your screens can have. This class also should be extending one main class (ex: login-form-practice-->
    bloc/auth_state.dart).
