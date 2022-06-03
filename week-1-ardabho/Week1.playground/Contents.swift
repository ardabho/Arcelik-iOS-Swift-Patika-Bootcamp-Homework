import Foundation

// Array and optionals practice

var watchBrands: [String]?
var brandString: String = ""

watchBrands = ["Apple", "Seiko", "Wainer", "Patek Philippe", "Casio", "Samsung"]

if let safeBrands = watchBrands {
    
    for brand in safeBrands {
        brandString = brandString + brand + ", "
    }
    print("Current brands are: \(brandString)")
    
} else {
    print("Error: brands array is nil")
}

print("--------------------------------------------------------------------------------------------------------------------")
//----------------------------------------------------------------------------------------------
// Set Practice

//Adding the same items to an array before turning it into a set
var guitarBrands = ["Gibson", "Fender", "Cort", "Takamine", "Taylor"]
var sameGuitarBrands = guitarBrands

guitarBrands.append(contentsOf: sameGuitarBrands)

print("GuitarBrands array before turning it into a Set: \(guitarBrands)")

var guitarBrandsSet = Set(guitarBrands)
print("GuitarBrands array after turning it into a Set: \(guitarBrandsSet)")

//Removing some items from the set
guitarBrandsSet.remove("Gibson")
guitarBrandsSet.remove("Taylor")

guitarBrandsSet

print("--------------------------------------------------------------------------------------------------------------------")
//---------------------------------------------------------------------------------------------
//Dictionary practice

var prices: [String : Float] = [:]
prices = [
    "Iphone 13" : 24000,
    "S22 Ultra" : 29000,
    "Pringles"  : 24,
    "Butter"    : 25,
    "Book"      : 60
]

//add new item
prices["Airpods Pro"] = 4000

//remove the butter
prices.removeValue(forKey: "Butter")

prices.forEach { (key,value) in
    print("Product: \(key)     Price: \(value)")
}

//filter expensive products and assign them to a different dictionary
let expensiveProducts = prices.filter { (key, value) in
    return value >= 5000
}

print("--------------------------------------------------------------------------------------------------------------------")
//---------------------------------------------------------------------------------------------
//Structs and enum

struct Car {
    
    private let brandName: String
    private let modelName: String
    private let carType: CarType //The type of car. Sedan, Sport etc. See the CarType enum
    private var passengerCount: Int
    private var engineStatus: Bool // True if the engine is running
    
    init(brandName: String, modelName: String , carType: CarType) {
        self.brandName = brandName
        self.modelName = modelName
        self.carType = carType
        passengerCount = 0
        engineStatus = false
    }
    
    //Number of seats set according to cars type.
    private var seatCount: Int {
        get {
            switch carType {
            case .sport:
                return 2
            case .sedan:
                return 4
            case .hatchBack:
                return 4
            case .jeep:
                return 6
            }
        }
    }
    
    /// Sets the passenger count of the car. Returns nothing
    /// - Parameter noOfPassengers: Number of current passengers in the car
    mutating func setPassengerCount(count noOfPassengers: Int) {
        
        guard (noOfPassengers <= seatCount) && (noOfPassengers > 0) else {
            print("The number of passengers cannot exceed the number of seats in the car!")
            return
        }
        passengerCount = noOfPassengers
    }
    
    /// Get the number of passengers in the car
    /// - Returns: Number of passengers in the car
    func getPassengerCount() -> Int {
        return passengerCount
    }
    
    ///Start the engine
    mutating func startTheCar() {
        if passengerCount != 0 {
            print("Engine started")
            engineStatus = true
        } else {
            print("There is no people in the car to start it")
        }
    }
    
    ///Stop the engine
    mutating func stopTheCar() {
        if passengerCount != 0 {
            print("Engine stopped")
            engineStatus = false
        } else {
            print("There is no people in the car to start it")
        }
    }
    
    /// Pick up some passengers
    /// - Parameter passengersForPickUp: Number of passengers to pick up
    mutating func pickUpPassenger(count passengersForPickUp: Int) {
        let newPassengerNumber = passengerCount + passengersForPickUp
        if newPassengerNumber > seatCount {
            print("The number of passengers cannot exceed the number of seats in the car!")
        } else {
            passengerCount = newPassengerNumber
        }
    }
    
    /// Drop some passengers
    /// - Parameter passengersToDrop: Number of passengers to drop off
    mutating func dropPassengers(count passengersToDrop: Int) {
        let newPassengerNumber = passengerCount - passengersToDrop
        if newPassengerNumber < 0 {
            print("Number of people in car can't be negative!")
        } else {
            passengerCount = newPassengerNumber
        }
    }
    
    ///Drive the car
    func drive() {
        if passengerCount > 0  && engineStatus {
            print("Driving...")
        }
        else if passengerCount <= 0  && engineStatus{
            print("There must be a driver in the car to drive")
        } else if passengerCount >= 0  && !engineStatus {
            print("You have to start the engine first")
        }
    }
    
}

//Enum for the cars type
enum CarType {
    case sport
    case sedan
    case hatchBack
    case jeep
}

var sedanCar = Car(brandName: "Audi", modelName: "A3", carType: .hatchBack)
var sportsCar = Car(brandName: "Mercedes", modelName: "Amg Gt", carType: .sport)
sportsCar.setPassengerCount(count: 2)
sportsCar.startTheCar()
sportsCar.drive()
sportsCar.dropPassengers(count: 1)
sportsCar.stopTheCar()

print("--------------------------------------------------------------------------------------------------------------------")

//---------------------------------------------------------------------------------------------
//Classes


/// Computer SuperClass
class Computer {
    private var ram = 0
    private var storage = 0
    private var brand: String
    
    init(ram: Int, storage: Int, brand: String) {
        self.ram = ram
        self.storage = storage
        self.brand = brand
    }
    
    ///Start the device
    func boot() {
        print("Booting device now...")
    }
    
    ///Turns device off
    func turnOff(){
        print("Turning off device now...")
    }
    
}

/**
 Subclass of Computer. Creates a desktop computer.
 */
class Desktop: Computer {
    
    private var caseType: String?
    
    init(brand: String, caseType: String?, ram: Int, storage: Int) {
        self.caseType = caseType
        super.init(ram: ram, storage: storage, brand: brand)
    }
    
    ///Start the device
    override func boot() {
        super.boot()
        print("Desktop computer booted succesful!")
    }
    
}

/**
 Subclass of Computer. Creates a laptop.
 */
class Laptop: Computer {
    
    private var screenSize: Float //Screen size in inches
    
    init(brand: String, ram: Int, storage: Int, screenSize: Float) {
        self.screenSize = screenSize
        super.init(ram: ram, storage: storage, brand: brand)
    }
    
    ///Start the device
    override func boot() {
        super.boot()
        print("Laptop booted succesfully!")
    }
    
}

/**
 Subclass of Computer. Creates a smartphone.
 */
class SmartPhone: Computer {
    
    private var screenSize: Float //Screen size in inches
    private var isBusy: Bool? //Set to true if there are any current tasks running
    
    init(brand: String, ram: Int, storage: Int, screenSize: Float) {
        self.screenSize = screenSize
        super.init(ram: ram, storage: storage, brand: brand)
    }
    
    ///Start the device
    override func boot() {
        super.boot()
        print("Smartphone booted succesfully!")
    }
    
    ///Changes the current process state of the phone to opposite value.
    func changeBusyState() {
        if let safeBusy = isBusy {
            isBusy = !safeBusy
        }
    }
    
    ///Used to set the Busy state
    enum Busy {
        case busy
        case notBusy
    }
    
    ///Sets the isBusy state of the smartphone to true or false. Should be set to true if there are any tasks running
    func setBusyState(to state: Busy){
        if state == .busy {
            isBusy = true
        } else {
            isBusy = false
        }
    }
    
    ///Turn off the smartphone
    override func turnOff() {
        super.turnOff()
        if let isBusy = isBusy {
            isBusy ? print("Cant turn off phone while there are current tasks running") : print("Device turned off succesfully")
        } else {
            print("Device turned off succesfully")
        }
    }
    
}

var homeComputer = Desktop(brand: "Apple", caseType: nil, ram: 8, storage: 512)
homeComputer.boot()

var workLaptop = Laptop(brand: "Apple", ram: 16, storage: 1024, screenSize: 16)
workLaptop.boot()

var personalPhone = SmartPhone(brand: "Samsung", ram: 6, storage: 256, screenSize: 6.1)
personalPhone.boot()

personalPhone.setBusyState(to: .busy)
personalPhone.turnOff()

personalPhone.changeBusyState()
personalPhone.turnOff()

print("--------------------------------------------------------------------------------------------------------------------")

//---------------------------------------------------------------------------------------------
//Mixed practice

///Variadic sum function. Takes as many Int parameters as you give
func sum(numbers: Int...) -> Int{
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

sum(numbers: 1,2,4,5,6,7,3,9)

//-----------------------------
//throws keyword

enum errorTypes: Error {
    case fatal
    case otherError
}

func checkError(errorName: String) throws -> Error {
    if errorName == "fatal"{
        return errorTypes.fatal
    } else {
        return errorTypes.otherError
    }
}

try checkError(errorName: "fatal")

//-----------------------------
//Exiting multiple loops:

outerLoop: for outerNum in 1...10 {
    for innerNum in 1...10 {
        if outerNum * innerNum == 50 {
            break outerLoop
        }
    }
}

//-----------------------------
//inout parameter:

func square(of num: inout Int) {
    num *= num
}

var inoutTestVariable = 8
square(of: &inoutTestVariable)

//-----------------------------
//search an array for a word

var nameArray = [String]()
nameArray = ["John", "Arthur", "Uncle", "Bill", "Lenny", "Sadie", "Micah","Abigail", "Dutch", "Hosea","Javier"]


/// Searches an array for the given string
/// - Parameters:
///   - searchName: String value to be searched
///   - array: Array to search
/// - Returns: Bool
func searchFor(_ searchName: String, in array: [String]) -> Bool {
    for name in array {
        if name == searchName {
            return true
        }
    }
    return false
}

searchFor("Arthur", in: nameArray)

//-----------------------------
//closures

var closureExample = {
    print("Hello my name is Arda")
}

func closureFunction(action: () -> Void) {
    action()
}

closureFunction {
    closureExample()
}

//closure with single parameter
func eatFood(action: (String) -> String) {
    print("I am getting ready to eat")
    let messageString = action("Tacos")
    print(messageString)
    print("All food is finished")
}

eatFood {
    "I am eating \($0)"
}

print("---------")
//closure with multiple parameters

func eatMoreFood(action: (String, Int) -> String) {
    print("I am getting ready to eat")
    let messageString = action("Tacos", 6)
    print(messageString)
    print("All food is finished")
}

eatMoreFood { food, foodCount in
    return "I am eating \(foodCount) \(food)"
}
