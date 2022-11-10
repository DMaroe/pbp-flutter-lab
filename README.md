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