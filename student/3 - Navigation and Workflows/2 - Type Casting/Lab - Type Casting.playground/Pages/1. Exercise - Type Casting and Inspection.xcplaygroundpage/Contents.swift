/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var collection: [Any] = [0.3, 16, "Hello World", false, true]
print(collection)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for i in 0..<collection.count {
    switch collection[i] {
    case is Int:
        print("The Integer has a value of \(collection[i])")
    case is Double:
        print("The Double has a value of \(collection[i])")
    case is String:
        print("The String has a value of \(collection[i])")
    default:
        print("The Boolean has a value of \(collection[i])")
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
var dictionaryCollection: [String: Any] = ["one": 0.3, "two": 16, "three": "74", "four": false, "five": true]
print(dictionaryCollection)

//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total = 0.0
for (_, value) in dictionaryCollection {
    switch value {
    case is Int:
        total += Double(value as! Int)
    case is Double:
        total += value as! Double
    case is String:
        total += 1
    default:
        total += value as! Bool ? 2 : -3
    }
}
print(total)
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2 = 0.0
for (_, value) in dictionaryCollection {
    switch value {
    case is Int:
        total2 += Double(value as! Int)
    case is Double:
        total2 += value as! Double
    case is String:
        if let string = value as? String {
            total2 += Double(string) ?? 0
        }
    default:
        total2 += 0
    }
}
print(total2)

/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
