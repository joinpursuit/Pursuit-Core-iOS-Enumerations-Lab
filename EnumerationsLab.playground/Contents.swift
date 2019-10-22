import UIKit

// Question One

// a. Define an enumeration called iOSDeviceType with member values iPhone, iPad, iWatch. Create a variable called myiPad and assign it to .iPad.

// Your code here
enum iOSDeviceType  {
    case iPhone
    case iPad
    case iWatch
}

let myiPad = iOSDeviceType.iPad

 //Uncomment the lines below to test your solution

//let myiPad = iOSDeviceType.iPad
assert(myiPad == .iPad)

// b. Adjust your code above so that iPhone and iPad have associated values of type String which represents the model number.  Create an instance of a .iPhone("8+") and assign it to a variable called myPhone

// Your code here
enum iOSDeviceType2  {
    case iPhone2(String)
    case iPad2(String)
    case iWatch2
}

let myiPad2 = iOSDeviceType2.iPad2("")
let myiPhone2 = iOSDeviceType2.iPhone2("8+")

// Uncomment the lines below to test your solution

switch myiPhone2 {
case let .iPhone2(model): assert(model == "8+", "Was expecting a model type of 8+, but got \(model)")
default: fatalError("Was expecting an iPhone but got \(myiPhone2)")
}

// Question Two

// Write a function named getPosition(startingAt:afterSteps:) that takes an array of Steps, and a starting location of (Int, Int) and returns an (Int, Int) tuple representing the final position.

//A step .up will increase the y coordinate by 1.
//A step .down will decrease the y coordinate by 1.
//A step .right will increase the x coordinate by 1.
//A step .left will decrease the x coordinate by 1.


enum Step {
    case up
    case down
    case left
    case right
}



// Your function here
func getPosition(startingAt : (x : Int, y : Int), afterSteps : [Step])  -> (Int, Int)
{
    let mySteps : [Step] = afterSteps
    var adjustedStep = startingAt
    for element in mySteps    {
        switch element   {
        case .right:
            adjustedStep.0 += 1
        case .down:
            adjustedStep.1 -= 1
        case .left:
            adjustedStep.0 -= 1
        case .up:
            adjustedStep.1 += 1
            
        }
    }
    return adjustedStep
}

//Uncomment the lines below to test your solution

let startingLocation = (x: 0, y: 0)
let steps: [Step] = [.up, .up, .left, .down, .left]
let expectedEndPosition = (x: -2, y: 1)
let endPosition = getPosition(startingAt: startingLocation, afterSteps: steps)

assert(endPosition == expectedEndPosition, "Was expecting \(expectedEndPosition) but got \(endPosition)")

// Question Three

// You are given a Coin enumeration which describes different coin values. Write a function called getTotalValue(from:) that takes in an array of tuples of type (number: Int, coin: Coin), and returns the total value of all coins in cents.

enum Coin: Int {
    case penny = 1
    case nickle = 5
    case dime = 10
    case quarter = 25
}

// Your function here
func getTotalValue(from tuples:[(numberOfCoins: Int, typeOfCoin : Coin)]) -> Int {
    var totalNumberOfCents = 0
    for tuple in tuples {
        switch tuple.typeOfCoin  { //access enum coin part in tuple
        case .penny:
            //multipky by tuple(for loop interator) so tuple.numberOfCoins or tuple.0
            totalNumberOfCents += Coin.penny.rawValue * tuple.numberOfCoins //penny value Int(1)
        case .nickle:
            totalNumberOfCents += Coin.nickle.rawValue * tuple.numberOfCoins
        case .dime:
            totalNumberOfCents += Coin.dime.rawValue * tuple.numberOfCoins
        case .quarter:
            totalNumberOfCents += Coin.quarter.rawValue * tuple.numberOfCoins
        }
    }
    return totalNumberOfCents
}

// Uncomment the lines below to test your solution

let coinArr: [(Int, Coin)] = [
    (10, .penny),
    (15, .nickle),
    (3, .quarter),
    (20, .penny),
    (3, .dime),
    (7, .quarter)
]

let expectedTotal = 385
let total = getTotalValue(from: coinArr)
assert(total == expectedTotal, "Was expecting \(expectedTotal), but got \(total)")

// Question Four

// Write an enum called Day to represent the days of the week with a raw value of type String.
// Write a method inside Day that returns whether or not it is a weekday (Monday - Friday)

// Your code here
enum Day: String    {
    case monday = "Monday is a weekday"
    case tuesday = "Tuesday is a weekday"
    case wednesday = "Wednesday is a weekday"
    case thursday = "Thursday is a weekday"
    case friday = "Friday is a weekday"
    case saturday = "Saturday is a weekend"
    case sunday = "Sunday is a weekend"
    
    func isWeekday() -> Bool {
        var isWeekday = false
        switch self {
        case .monday:
            print(Day.monday.rawValue)
            isWeekday = true
        case .tuesday:
            print(Day.tuesday.rawValue)
            isWeekday = true
        case .wednesday:
            print(Day.wednesday.rawValue)
            isWeekday = true
        case .thursday:
            print(Day.thursday.rawValue)
            isWeekday = true
        case .friday:
            print(Day.friday.rawValue)
            isWeekday = true
        case .saturday:
            print(Day.saturday.rawValue)
            isWeekday = false
        case .sunday:
            print(Day.sunday.rawValue)
            isWeekday = false
        }
        return isWeekday
    }
}

// Uncomment the lines below to test your solution

assert(Day.monday.isWeekday() == true, "Monday is a weekday")
assert(Day.tuesday.isWeekday() == true, "Tuesday is a weekday")
assert(Day.wednesday.isWeekday() == true, "Wednesday is a weekday")
assert(Day.thursday.isWeekday() == true, "Thursday is a weekday")
assert(Day.friday.isWeekday() == true, "Friday is a weekday")
assert(Day.saturday.isWeekday() == false, "Saturday is not a weekday")
assert(Day.sunday.isWeekday() == false, "Sunday is not a weekday")

// Question Five

//Define an enumeration named HandShape with three members: .rock, .paper, .scissors.
//Define an enumeration named MatchResult with three members: .win, .draw, .lose.
//Write a function called matchResult(fromPlayerOneShape:andPlayerTwoShape:) that takes two HandShapes and returns a MatchResult. It should return the outcome for the first player (the one with the first hand shape).
//
//Rock beats scissors, paper beats rock, scissor beats paper

// Your code here
enum HandShape  {
    case rock
    case paper
    case scissors
}

enum MatchResult    {
    case win
    case draw
    case lose
}

func matchResult(fromPlayerOneShape: HandShape, andPlayerTwoShape: HandShape) -> MatchResult {
    var result = MatchResult.win
   
    if fromPlayerOneShape == andPlayerTwoShape  {
        result = .draw
    }
    else if fromPlayerOneShape == HandShape.rock && andPlayerTwoShape == HandShape.scissors {
        result = .win
    }
    else if fromPlayerOneShape == HandShape.rock && andPlayerTwoShape == HandShape.paper {
    result = .lose
    }
    else if fromPlayerOneShape == HandShape.scissors && andPlayerTwoShape == HandShape.paper {
    result = .win
    }
    else if fromPlayerOneShape == HandShape.scissors && andPlayerTwoShape == HandShape.rock {
    result = .lose
    }
    else if fromPlayerOneShape == HandShape.paper && andPlayerTwoShape == HandShape.rock {
    result = .win
    }
    else if fromPlayerOneShape == HandShape.paper && andPlayerTwoShape == HandShape.scissors {
    result = .lose
    }
    return result
}

// Uncomment the lines below to test your solution

let testCases: [(HandShape, HandShape, MatchResult)] = [
    (.rock, .paper, .lose),
    (.paper, .paper, .draw),
    (.scissors, .rock, .lose),
    (.rock, .scissors, .win)
]

for testCase in testCases {
    let expectedOutput = testCase.2
    let output = matchResult(fromPlayerOneShape: testCase.0, andPlayerTwoShape: testCase.1)
    assert(output == expectedOutput, "Was execting \(expectedOutput), but got \(output) for inputs \(testCase.0) and \(testCase.1)")
}
