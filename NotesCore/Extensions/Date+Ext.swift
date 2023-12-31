//
//  Date+Ext.swift
//  NotesCore
//
//  Created by Dogukaim on 30.12.2023.
//

import Foundation


extension Date {
    func format() -> String {
        let formatter = DateFormatter()
        if Calendar.current.isDateInToday(self) {
            formatter.dateFormat = "h:mm a"
            
        } else {
            formatter.dateFormat = "dd/MM/yy"
        }
        return formatter.string(from: self)
    }
}
