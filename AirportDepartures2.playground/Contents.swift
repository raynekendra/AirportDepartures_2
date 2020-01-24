import UIKit


//: ## 1. Create custom types to represent an Airport Departures display
//: ![Airport Departures](matthew-smith-5934-unsplash.jpg)
//: Look at data from [Departures at JFK Airport in NYC](https://www.airport-jfk.com/departures.php) for reference.
//:
//: a. Use an `enum` type for the FlightStatus (En Route, Scheduled, Canceled, Delayed, etc.)
//:
//: b. Use a struct to represent an `Airport` (Destination or Arrival)
//:
//: c. Use a struct to represent a `Flight`.
//:
//: d. Use a `Date?` for the departure time since it may be canceled.
//:
//: e. Use a `String?` for the Terminal, since it may not be set yet (i.e.: waiting to arrive on time)
//:
//: f. Use a class to represent a `DepartureBoard` with a list of departure flights, and the current airport
enum FlightStatus: String {
    case EnRoute = "En-Route"
    case Scheduled = "Scheduled"
    case Cancelled = "Cancelled"
    case Delayed = "Delayed"
    case Landed = "Landed"
    case Boarding = "Boarding"
}

struct Airport {
    let cityName: String
    let airportCode: String
}

struct Flight {
    let airline: String
    let flightNumber: String
    let destination: Airport
    let departureTime: Date?
    let terminal: String?
    let flightStatus: FlightStatus
    
//    init(airline: String, flightNumber: String, destination: Airport, departureTime: Date? = Date(), terminal: String? = nil, flightStatus: FlightStatus) {
//        self.airline = airline
//        self.flightNumber = flightNumber
//        self.destination = destination
//        self.flightStatus = flightStatus
//    }

}

let atl = Airport(cityName: "Atlanta", airportCode: "ATL")
let lax = Airport(cityName: "Los Angeles", airportCode: "LAX")
let mia = Airport(cityName: "Miami", airportCode: "MIA")

let airportsArray: [Airport] = [atl, lax, mia]

//
//Step 2:
//2. Create 3 flights and add them to a departure board
//
//a. For the departure time, use Date() for the current time
//
//b. Use the Array append() method to add Flight's
//
//c. Make one of the flights .canceled with a nil departure time
//
//d. Make one of the flights have a nil terminal because it has not been decided yet.
//
//e. Stretch: Look at the API for DateComponents for creating a specific time




var flight1 = Flight(airline: "Delta Airlines", flightNumber: "DL2341", destination: atl, departureTime: Date(), terminal: "4", flightStatus: .Scheduled)
var flight2 = Flight(airline: "Aeromexico", flightNumber: "AM5520", destination: lax, departureTime: Date(), terminal: nil, flightStatus: .Delayed)
var flight3 = Flight(airline: "China Southern Airlines", flightNumber: "CZ1001", destination: mia, departureTime: nil, terminal: "4", flightStatus: .Cancelled)

let flightsArray: [Flight] = [flight1, flight2, flight3]


class DepartureBoard {
    var departureFlights: [Flight]
    var currentAirport: Airport
    init(currentAirport: Airport) {
        self.departureFlights = []
        self.currentAirport = currentAirport
    }
}
























let date = Date()
for contents in [lax] {
    print(lax.cityName + ":" + lax.airportCode)
}
// only did that ^ to see if it made the print prettier. i don't remember what it's called, if there's a name for changing lldb = pretty print lol

let jfkDepartureBoard = DepartureBoard(currentAirport: atl)


jfkDepartureBoard.departureFlights.append(contentsOf: flightsArray)







//: ## 3. Create a free-standing function that can print the flight information from the `DepartureBoard`
//: a. Use the function signature: `printDepartures(departureBoard:)`
//:
//: b. Use a `for in` loop to iterate over each departure
//:
//: c. Make your `FlightStatus` enum conform to `String` so you can print the `rawValue` String values from the `enum`. See the [enum documentation](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html).
//:
//: d. Print out the current DepartureBoard you created using the function
func printDepartures(departureBoard: [DepartureBoard]) {
    for flightInfo in [jfkDepartureBoard] {
        print("\n\(flightInfo)")
    }
}
printDepartures(departureBoard: [jfkDepartureBoard])
//come back to why this isn't printing smoothly ^


//

//: ## 4. Make a second function to print print an empty string if the `departureTime` is nil
//: a. Createa new `printDepartures2(departureBoard:)` or modify the previous function
//:
//: b. Use optional binding to unwrap any optional values, use string interpolation to turn a non-optional date into a String
//:
//: c. Call the new or udpated function. It should not print `Optional(2019-05-30 17:09:20 +0000)` for departureTime or for the Terminal.
//:
//: d. Stretch: Format the time string so it displays only the time using a [`DateFormatter`](https://developer.apple.com/documentation/foundation/dateformatter) look at the `dateStyle` (none), `timeStyle` (short) and the `string(from:)` method
//:
//: e. Your output should look like:
//:
//:     Destination: Los Angeles Airline: Delta Air Lines Flight: KL 6966 Departure Time:  Terminal: 4 Status: Canceled
//:     Destination: Rochester Airline: Jet Blue Airways Flight: B6 586 Departure Time: 1:26 PM Terminal:  Status: Scheduled
//:     Destination: Boston Airline: KLM Flight: KL 6966 Departure Time: 1:26 PM Terminal: 4 Status: Scheduled
// optionals were departuretime and terminal




func printDepartures2(departureBoard: DepartureBoard) {
    for departureTime in flightsArray {
        if departureTime == nil {
            print("")
        }
    }
}

printDepartures(departureBoard: [jfkDepartureBoard])

//why isn't this working... but at least no error codes........... ?????
//: ## 5. Add an instance method to your `DepatureBoard` class (above) that can send an alert message to all passengers about their upcoming flight. Loop through the flights and use a `switch` on the flight status variable.
//: a. If the flight is canceled print out: "We're sorry your flight to \(city) was canceled, here is a $500 voucher"
//:
//: b. If the flight is scheduled print out: "Your flight to \(city) is scheduled to depart at \(time) from terminal: \(terminal)"
//:
//: c. If their flight is boarding print out: "Your flight is boarding, please head to terminal: \(terminal) immediately. The doors are closing soon."
//:
//: d. If the `departureTime` or `terminal` are optional, use "TBD" instead of a blank String
//:
//: e. If you have any other cases to handle please print out appropriate messages
//:
//: d. Call the `alertPassengers()` function on your `DepartureBoard` object below
//:
//: f. Stretch: Display a custom message if the `terminal` is `nil`, tell the traveler to see the nearest information desk for more details.




//: ## 6. Create a free-standing function to calculate your total airfair for checked bags and destination
//: Use the method signature, and return the airfare as a `Double`
//:
//:     func calculateAirfare(checkedBags: Int, distance: Int, travelers: Int) -> Double {
//:     }
//:
//: a. Each bag costs $25
//:
//: b. Each mile costs $0.10
//:
//: c. Multiply the ticket cost by the number of travelers
//:
//: d. Call the function with a variety of inputs (2 bags, 2000 miles, 3 travelers = $750)
//:
//: e. Make sure to cast the numbers to the appropriate types so you calculate the correct airfare
//:
//: f. Stretch: Use a [`NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter) with the `currencyStyle` to format the amount in US dollars.

