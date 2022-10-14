/*:
## Exercise - Types and Type Safety
 
 Declare two variables, one called `firstDecimal` and one called `secondDecimal`. Both should have decimal values. Look at both of their types by holding Option and clicking the variable name.
 */
var firstDecimal = 0.3;
var secondDecimal = 3.14;
//:  Declare a variable called `trueOrFalse` and give it a boolean value. Try to assign it to `firstDecimal` like so: `firstDecimal = trueOrFalse`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.
var trueOrFalse = true;
//firstDecimal = trueOrFalse;
print("It doesn't compile because firstDecimal holds a double while trueOrFalse holds a boolean value. A double cannot hold a non-number value");
//:  Declare a variable and give it a string value. Then try to assign it to `firstDecimal`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.
var stringCheese = "stringy";
//firstDecimal = stringCheese;
print("It doesn't compile because firstDecimal holds a double while stringCheese holds a string of characters. A double cannot hold a non-number value");
//:  Finally, declare a variable with a whole number value. Then try to assign it to `firstDecimal`. Why won't this compile even though both variables are numbers? Print a statement to the console explaining why not, and remove the line of code that will not compile.
var integer = 3;
//firstDecimal = integer;
print("Although both of these variables are numbers, a double specifically holds numbers with decimals and so it cannot hold an integer without first type casting it.");
/*:
[Previous](@previous)  |  page 7 of 10  |  [Next: App Exercise - Tracking Different Types](@next)
 */
