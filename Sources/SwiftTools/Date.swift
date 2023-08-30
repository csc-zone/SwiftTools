//
//  File.swift
//  
//
//  Created by baby on 2023/7/11.
//

import Foundation

public extension Date {
    
    var year: Int {
        Calendar.current.component(.year, from: self)
    }
    
    static func from(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date? {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        return calendar.date(from: dateComponents) ?? nil
    }
    
    var yyyyMMdd: String {
        return DateFormatter.yyyyMMdd.string(from: self)
    }
    
    var monthStart: Date {
        get {
            let calender = Calendar.current
            var dateComponents = calender.dateComponents([.year, .month, .day], from: self)
            dateComponents.day = 1
            dateComponents.timeZone = NSTimeZone.system
            return calender.date(from: dateComponents)!
        }
    }

    static func parseEpgDate(_ date: String?) -> Date? {
        guard let date = date else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss Z"
        return dateFormatter.date(from: date)
    }
    
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    func currentTimeSeconds() -> Int64 {
        return Int64(self.timeIntervalSince1970)
    }

}

public extension DateFormatter {
    static var yyyyMMdd: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }
    
    static var yyyy__MM__dd: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }
    
    static var yyyy_MM_dd: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
}

