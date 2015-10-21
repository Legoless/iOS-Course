//: DN1

import Foundation

class Currency {
    var type: String
    var rate: Double
    
    init ()
    {
        type = "EUR"
        rate = 1.0
    }
    
    init (type: String, rate: Double)
    {
        self.type = type
        self.rate = rate
    }
}

class Converter {
    func convert (value: Double, startCurrency: Currency, targetCurrency: Currency) -> (Double, Double)
    {
        return (value * startCurrency.rate * targetCurrency.rate, startCurrency.rate * targetCurrency.rate)
    }
}

let EUR = Currency()

let USD = Currency(type: "USD", rate: 1.13)

let converter = Converter()

let value = 80.0

let (converted1, conversionRate) = converter.convert(value, startCurrency: EUR, targetCurrency: USD)

let formatted = String(format: "%.2f", converted1)

//let formatted = NSString.localizedStringWithFormat("%.2f", converted1)

print ("\(value) EUR v USD: \(formatted), tečaj: \(conversionRate) EUR")

// Kako bi izpisali z 2 decimalkah?
