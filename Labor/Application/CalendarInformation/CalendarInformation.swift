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
//    Number of year
    let currentYear = Calendar.current.component(.year, from: Date())
//    Number of month
    let currentMonth = Calendar.current.component(.month, from: Date())
//    Number of day
    let currentDay = Calendar.current.component(.day, from: Date())
//  Number of days in each month
    func formaterCalendar() {
        let monthCountDay = ["31", "29", "31", "30", "31", "31", "31", "31", "30", "31" , "30", "31"]

        switch currentMonth {
        case 1:
            for day in currentDay...(Int(monthCountDay[0]) ?? 0) {
                let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                calendarDate.append(dayFormat)
            }
            
        case 2:
            for day in currentDay...(Int(monthCountDay[1]) ?? 0) {
                let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                calendarDate.append(dayFormat)
            }
            
        case 3:
            for day in currentDay...(Int(monthCountDay[2]) ?? 0) {
                let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                calendarDate.append(dayFormat)
            }
            
        case 4:
            for day in currentDay...(Int(monthCountDay[3]) ?? 0) {
                let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                calendarDate.append(dayFormat)
            }
            
        case 5:
            for day in currentDay...(Int(monthCountDay[4]) ?? 0) {
                let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                calendarDate.append(dayFormat)
            }
            
        case 6:
            for day in currentDay...(Int(monthCountDay[5]) ?? 0) {
                let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                calendarDate.append(dayFormat)
            }
            
        case 7:
            for day in currentDay...(Int(monthCountDay[6]) ?? 0) {
                let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                calendarDate.append(dayFormat)
            }
            
        case 8:
            for day in currentDay...(Int(monthCountDay[7]) ?? 0) {
                let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                calendarDate.append(dayFormat)
            }
            
        case 9:
            for day in currentDay...(Int(monthCountDay[8]) ?? 0) {
                let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                calendarDate.append(dayFormat)
            }
            
        case 10:
            for day in currentDay...(Int(monthCountDay[9]) ?? 0) {
                let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                calendarDate.append(dayFormat)
            }
            
        case 11:
            for day in currentDay...(Int(monthCountDay[10]) ?? 0) {
                let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                calendarDate.append(dayFormat)
            }
            
        case 12:
            for day in currentDay...(Int(monthCountDay[11]) ?? 0) {
                let dayFormat = "\(day).\(currentMonth).\(currentYear)"
                calendarDate.append(dayFormat)
            }
            
        default:
            break
        }
    }
}
