//
//  DateHelpers.swift
//  com.rideplanning
//
//  Created by Patrick Moniqui on 17-11-22.
//  Copyright © 2017 Patrick Moniqui. All rights reserved.
//

import Foundation

class DateHelpers
{
    static func stringToDate(dateString: String?) -> Date? {
        
        let dateFormat = "HH:mm:"
        
        if dateString == nil {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        let date = dateFormatter.date(from: dateString!)
        return date ?? nil
    }
}
