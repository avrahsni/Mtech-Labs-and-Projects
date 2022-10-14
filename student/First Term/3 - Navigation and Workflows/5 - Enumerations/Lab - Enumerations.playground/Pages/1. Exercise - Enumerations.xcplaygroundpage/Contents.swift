/*:
## Exercise - Enumerations
 
 Define a `Suit` enum with four possible cases: `clubs`, `spades`, `diamonds`, and `hearts`.
 */
enum Suit {
    case clubs, spades, diamonds, hearts
}

//:  Imagine you are being shown a card trick and have to draw a card and remember the suit. Create a variable instance of `Suit` called `cardInHand` and assign it to the `hearts` case. Print out the instance.
var cardInHand = Suit.hearts
print(cardInHand)
//:  Now imagine you have to put back the card you drew and draw a different card. Update the variable to be a spade instead of a heart.
cardInHand = Suit.spades

//:  Imagine you are writing an app that will display a fun fortune (i.e. something like "You will soon find what you seek.") based on cards drawn. Write a function called `getFortune(cardSuit:)` that takes a parameter of type `Suit`. Inside the body of the function, write a switch statement based on the value of `cardSuit`. Print a different fortune for each `Suit` value. Call the function a few times, passing in different values for `cardSuit` each time.
func getFortune(cardSuit: Suit) {
    switch cardSuit {
    case .hearts:
        print("You will soon find what you seek")
    case .spades:
        print("The stars are in your favor")
    case .clubs:
        print("What you need is not where you expect")
    default:
        print("You will soon have an unexpected encounter")
    }
}
getFortune(cardSuit: .hearts)
getFortune(cardSuit: .spades)
getFortune(cardSuit: .clubs)
getFortune(cardSuit: .diamonds)
//:  Create a `Card` struct below. It should have two properties, one for `suit` of type `Suit` and another for `value` of type `Int`.
struct Card {
    let suit: Suit
    let value: Value
    enum Value {
        case ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }
}

//:  How many values can playing cards have? How many values can `Int` be? It would be safer to have an enum for the card's value as well. Inside the struct above, create an enum for `Value`. It should have cases for `ace`, `two`, `three`, `four`, `five`, `six`, `seven`, `eight`, `nine`, `ten`, `jack`, `queen`, `king`. Change the type of `value` from `Int` to `Value`. Initialize two `Card` objects and print a statement for each that details the card's value and suit.
let card1 = Card(suit: .hearts, value: .king)
let card2 = Card(suit: .spades, value: .ace)
print("Card 1 is the \(card1.value) of \(card1.suit)")
print("Card 2 is the \(card2.value) of \(card2.suit)")
/*:
page 1 of 2  |  [Next: App Exercise - Swimming Workouts](@next)
 */
