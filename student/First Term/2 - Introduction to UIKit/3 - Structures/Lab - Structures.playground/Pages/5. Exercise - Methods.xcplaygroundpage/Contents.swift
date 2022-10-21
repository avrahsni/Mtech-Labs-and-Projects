/*:
## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
    
    func description() {
        print("The book \(title) by \(author) has \(pages) pages and costs $\(price)")
    }
}
var favoriteBook = Book(title: "The Alchemist", author: "Paulo Coelho", pages: 167, price: 13.99)
favoriteBook.description()
//:  A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
struct Post {
    var message: String
    var likes: Int
    var numberOfComments: Int
    
    mutating func Like() {
        likes += 1
    }
}
var image = Post(message: "hello world", likes: 0, numberOfComments: 0)
print(image.likes)
image.Like()
print(image.likes)
/*:
[Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Workout Functions](@next)
 */