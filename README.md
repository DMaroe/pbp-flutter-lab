PBP Assignment 7 
----------------
**Name : Dylan Dahran Pribadi**
**NPM  : 2106720872**

-----------------

>1. Explain what is meant by stateless widget and stateful widget and explain the difference between them.

- with the base word of "state" both stateless and stateful widget means the widget's state or the widget's condition. A stateless widget means that there is no state or condition, in this definition, stateless widget means the widget can't be changed or it is static. On the other hand, stateful means the widget can be changed dynamically based on a state or condition.

>2. Mention what widgets you use in this project and explain their functions.

- Text() : basically shows text
- Padding() : giving distance to the widget in all direction
- SizedBox(): creating a box with a certain size
- Row(): customizing widget in x axis
- Column(): customizing widget in y axis
- FloatingActionButton(): make a certain button do an action after clicked
- MaterialApp(): initializing title, theme, and other bases of children widgets
- Scaffold(): a return for the body implemented
- AppBar(): to show content

>3. What is the function of setState()? Explain what variables that can be affected by the function.

- it is basically functioned to change what's inside a stateful widget with a new value. Variables that are affected in this assignment are _counter and _counter > 0 (showing a decrement floating button).

>4. Explain the difference between const and final.

- Const : Behaves exactly like the final keyword. But, const makes the variable constant from compile-time only
- Final : used to hardcode the values of the variable and it cannot be altered in the future, neither any kind of operations performed on these variables can alter its value (state).

>5. Explain how you implement the checklist above.

- create the flutter app named counter_7
- create a function to decrement, increment and renew _counter
- adds 2 FloatingActionButton() to trigger the decrement and increment function

----------------
PBP Assignment 8
----------------
**Name : Dylan Dahran Pribadi**
**NPM  : 2106720872**

-----------------
>1. Difference between Navigator.push and Navigator.pushReplacement
- I've learned this from data structures and algorithms, let's say there's a stack with (x, y, z) as its inside. After that, we want to put a inside the stack. Example : if we use Navigator.push the contains will be (x, y, z, a), else if we use Navigator.pushReplacement it will be (x, y, a).

>2. All widgets used in this project
- Scaffold(): a return for the body implemented
- AppBar(): to show content
- Text() : basically shows text
- Padding() : giving distance to the widget in all direction
- Container() : used for containing a widget
- Row(): customizing widget in x axis
- Column(): customizing widget in y axis
- TextFormField() : form field that has text inside
- Form() : grouping container for form fields
- DropdownButton : a design button that contains a list of items
- showDatePicker : a design button for user to pick dates
- ElevatedButton : to trigger an event

>3. Events that exist in Flutter
- onPressed
- onHover
- onTap
- onSaved

>4. Explain how the Navigator works in "switching" pages of a Flutter application
The navigator displays the topmost screen by checking the method used by the object Navigator. When moving to a new screen, BuildContext that saves the widgets can be accessed by navigator with using stack methods such as push(), pushReplacement(), and pop().

>5. Implementation
- Create a new page for budget_list and budget_form
- Creating a Drawer widget.
- Navigation setup at the Drawer
- Create a global list that is located at the root widget to save the object Budget
- Implement forms using fields such as TextFormField etc.
- Put a Save button to save the budget add to the global list
- Show all the object budget with a custom BudgetCard while doing iterations through ListView.builder

-----------------
PBP Assignment 9 
----------------
**Name : Dylan Dahran Pribadi**
**NPM  : 2106720872**

-----------------
>1. Can we retrieve JSON data without creating a model first? If yes, is it better than creating a model before retrieving JSON data?
Ans : it is posible to retrieve JSON data, however it wouldn't be the best practice as an implementation. It would be better to create a model first and migrate the data to the model. It is bound to minimalize faults in the data sent through http request.

>2. Widgets used
- Scaffold(): a return for the body implemented
- AppBar(): to show content
- Text() : basically shows text
- Padding() : giving distance to the widget in all direction
- Container() : used for containing a widget
- Row(): customizing widget in x axis
- Form() : grouping container for form fields
- DropdownButton : a design button that contains a list of items
- showDatePicker : a design button for user to pick dates
- ElevatedButton : to trigger an event
- Drawer : shows a drower witha hamburger menu as an icon
- GestureDetector : to detect event gestures
- ListView.builder : to generate array for the scrollable widget
- showDatePicker : to show a date picker thing

>3. Mechanism of retrieving data from JSON so it can be shown in flutter
- Add a http dependency
- Make an http request to the webservice that is also using http as a dependency
- Decode data used to JSON
- Show converted data that is used to convert to the application using FutureBuilder

>4. How to implement the checklist above
- create pages : watchlists and watchlists_detail
- create a new model : watchList_models
- create a remote data source from JSON and create an asynchronous function with returning Future<List<WatchItem>> 
- at the page watchlists put a FutureBuilder to show GET request at url mywatchlist
