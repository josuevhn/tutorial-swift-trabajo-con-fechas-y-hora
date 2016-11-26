//: Playground - noun: a place where people can play

import Cocoa

// Obtener la fecha y hora actual

let date = Date()

print(date)

// Dando formato a una fecha y hora

let dateFormatter = DateFormatter()

dateFormatter.locale = Locale(identifier: "es_EC")

dateFormatter.dateStyle = .full
dateFormatter.timeStyle = .full

print(dateFormatter.string(from: date))

// Cambiando el formato por defecto

dateFormatter.setLocalizedDateFormatFromTemplate("ddMMyy hh:mm:ss")

print(dateFormatter.string(from: date))

// Comparar dos fechas

var firstDateComponents = DateComponents()
var secondDateComponents = DateComponents()

firstDateComponents.day = 01
firstDateComponents.month = 01
firstDateComponents.year = 2017

firstDateComponents.timeZone = TimeZone(abbreviation: "UTC")

secondDateComponents.day = 01
secondDateComponents.month = 02
secondDateComponents.year = 2017

secondDateComponents.timeZone = TimeZone(abbreviation: "UTC")

var firstDate = Calendar(identifier: Calendar.Identifier.gregorian).date(from: firstDateComponents)
var secondDate = Calendar(identifier: Calendar.Identifier.gregorian).date(from: secondDateComponents)

print(firstDate!)
print(secondDate!)

if (firstDate?.compare(secondDate!) == .orderedAscending) {
    
    print("firstDate < secondDate")
    
} else if (firstDate?.compare(secondDate!) == .orderedDescending) {
    
    print("firstDate > secondDate")
    
} else if (firstDate?.compare(secondDate!) == .orderedSame) {
    
    print("firstDate = secondDate")
    
} // else

// Opción más legible

if (firstDate! < secondDate!) {
    
    print("firstDate < secondDate")
    
} else if (firstDate! > secondDate!) {
    
    print("firstDate > secondDate")
    
} else if (firstDate! == secondDate!) {
    
    print("firstDate = secondDate")
    
} // else

// Objeto Date a partir de un String

var dateString = "23/04/2017"

var dateStringFormatter = DateFormatter()

dateStringFormatter.dateFormat = "dd/MM/yyyy"

var dateFromString = dateStringFormatter.date(from: dateString)

print(dateStringFormatter.string(from: dateFromString!))

// Formateando Componentes de Fecha y Tiempo

var someDateComponents = DateComponents()

someDateComponents.day = 23
someDateComponents.month = 04
someDateComponents.year = 2017
someDateComponents.calendar = Calendar(identifier: .gregorian)
someDateComponents.timeZone = TimeZone(abbreviation: "UTC")

var someDateComponentsFormatter = DateComponentsFormatter()

someDateComponentsFormatter.unitsStyle = .full
someDateComponentsFormatter.includesApproximationPhrase = true
someDateComponentsFormatter.includesTimeRemainingPhrase = true
someDateComponentsFormatter.allowedUnits = [.month, .day, .hour]

let futureDate = someDateComponents.date

let remainingTime = someDateComponentsFormatter.string(from: Date(), to: futureDate!)!

var outputDateFormatter = DateFormatter()

outputDateFormatter.dateFormat = "dd/MM/yyyy"

print("From today \(outputDateFormatter.string(from: Date())) to 23/04/2017 there is \(remainingTime)")

// Formateando Intervalos de Tiempo

let intervalFormatter = DateIntervalFormatter()

intervalFormatter.dateStyle = .full
intervalFormatter.timeStyle = .medium

let startDate = Date()

let endDate = Date(timeInterval: 172800, since: startDate)

let intervalFormatterOutputString = intervalFormatter.string(from: startDate, to: endDate)

print(intervalFormatterOutputString)
