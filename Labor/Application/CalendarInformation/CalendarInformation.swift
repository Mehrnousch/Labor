//
//  CalendarInformation.swift
//  Labor
//
//  Created by mehrnoush abdinian on 04.09.22.
//

import UIKit

class CalendarInformation {
    
    static let shared = CalendarInformation()
    
    var calendarDate: [String] = []
    let currentYear = Calendar.current.component(.year, from: Date())
    let currentMonth = Calendar.current.component(.month, from: Date())
    let currentDay = Calendar.current.component(.day, from: Date()) + 1

    func formaterCalendar() {
        let monthCountDay = ["31", "29", "31", "30", "31", "31", "31", "31", "30", "31" , "30", "31"]

        switch currentMonth {
        case 1:
            let monCount = (Int(monthCountDay[0]) ?? 0)
            for day in currentDay...monCount + (Int(monthCountDay[1]) ?? 0) {
                if day <= monCount {
                    let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                    calendarDate.append(dayFormat)
                } else {
                    let dayFormat = "\(day - monCount).\(currentMonth + 1).\(currentYear)"
                    calendarDate.append(dayFormat)
                }
            }
            
        case 2:
            let monCount = (Int(monthCountDay[1]) ?? 0)
            for day in currentDay...monCount + (Int(monthCountDay[2]) ?? 0) {
                if day <= monCount {
                    let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                    calendarDate.append(dayFormat)
                } else {
                    let dayFormat = "\(day - monCount).\(currentMonth + 1).\(currentYear)"
                    calendarDate.append(dayFormat)
                }
            }
            
        case 3:
            let monCount = (Int(monthCountDay[2]) ?? 0)
            for day in currentDay...monCount + (Int(monthCountDay[3]) ?? 0) {
                if day <= monCount {
                    let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                    calendarDate.append(dayFormat)
                } else {
                    let dayFormat = "\(day - monCount).\(currentMonth + 1).\(currentYear)"
                    calendarDate.append(dayFormat)
                }
            }
            
        case 4:
            let monCount = (Int(monthCountDay[3]) ?? 0)
            for day in currentDay...monCount + (Int(monthCountDay[4]) ?? 0) {
                if day <= monCount {
                    let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                    calendarDate.append(dayFormat)
                } else {
                    let dayFormat = "\(day - monCount).\(currentMonth + 1).\(currentYear)"
                    calendarDate.append(dayFormat)
                }
            }
            
        case 5:
            let monCount = (Int(monthCountDay[4]) ?? 0)
            for day in currentDay...monCount + (Int(monthCountDay[5]) ?? 0) {
                if day <= monCount {
                    let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                    calendarDate.append(dayFormat)
                } else {
                    let dayFormat = "\(day - monCount).\(currentMonth + 1).\(currentYear)"
                    calendarDate.append(dayFormat)
                }
            }
            
        case 6:
            let monCount = (Int(monthCountDay[5]) ?? 0)
            for day in currentDay...monCount + (Int(monthCountDay[6]) ?? 0) {
                if day <= monCount {
                    let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                    calendarDate.append(dayFormat)
                } else {
                    let dayFormat = "\(day - monCount).\(currentMonth + 1).\(currentYear)"
                    calendarDate.append(dayFormat)
                }
            }
            
        case 7:
            let monCount = (Int(monthCountDay[6]) ?? 0)
            for day in currentDay...monCount + (Int(monthCountDay[7]) ?? 0) {
                if day <= monCount {
                    let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                    calendarDate.append(dayFormat)
                } else {
                    let dayFormat = "\(day - monCount).\(currentMonth + 1).\(currentYear)"
                    calendarDate.append(dayFormat)
                }
            }
            
        case 8:
            let monCount = (Int(monthCountDay[7]) ?? 0)
            for day in currentDay...monCount + (Int(monthCountDay[8]) ?? 0) {
                if day <= monCount {
                    let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                    calendarDate.append(dayFormat)
                } else {
                    let dayFormat = "\(day - monCount).\(currentMonth + 1).\(currentYear)"
                    calendarDate.append(dayFormat)
                }
            }
            
        case 9:
            let monCount = (Int(monthCountDay[8]) ?? 0)
            for day in currentDay...monCount + (Int(monthCountDay[9]) ?? 0) {
                if day <= monCount {
                    let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                    calendarDate.append(dayFormat)
                } else {
                    let dayFormat = "\(day - monCount).\(currentMonth + 1).\(currentYear)"
                    calendarDate.append(dayFormat)
                }
            }
            
        case 10:
            let monCount = (Int(monthCountDay[9]) ?? 0)
            for day in currentDay...monCount + (Int(monthCountDay[10]) ?? 0) {
                if day <= monCount {
                    let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                    calendarDate.append(dayFormat)
                } else {
                    let dayFormat = "\(day - monCount).\(currentMonth + 1).\(currentYear)"
                    calendarDate.append(dayFormat)
                }
            }
            
        case 11:
            let monCount = (Int(monthCountDay[10]) ?? 0)
            for day in currentDay...monCount + (Int(monthCountDay[11]) ?? 0) {
                if day <= monCount {
                    let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                    calendarDate.append(dayFormat)
                } else {
                    let dayFormat = "\(day - monCount).\(currentMonth + 1).\(currentYear)"
                    calendarDate.append(dayFormat)
                }
            }
            
        case 12:
            let monCount = (Int(monthCountDay[11]) ?? 0)
            for day in currentDay...monCount + (Int(monthCountDay[0]) ?? 0) {
                if day <= monCount {
                    let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                    calendarDate.append(dayFormat)
                } else {
                    let dayFormat = "\(day - monCount).\(1).\(currentYear + 1)"
                    calendarDate.append(dayFormat)
                }
            }
            
        default:
            break
        }
    }
}
