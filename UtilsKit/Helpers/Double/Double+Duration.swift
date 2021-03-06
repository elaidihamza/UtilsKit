//
//  Double+Duration.swift
//  UtilsKit
//
//  Created by Michael Coqueret on 03/09/2020.
//  Copyright © 2020 iD.apps. All rights reserved.
//

import Foundation

extension Double {
    
    /**
     Self in duration.
     
     - returns: self in duration.
     */
    public func toDuration() -> String {
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        formatter.unitsStyle = .full
        
        return formatter.string(from: TimeInterval(self)) ?? ""
    }
}

extension Int {
    
    /**
     Self in duration.
     
     - returns: self in duration.
     */
    public func toDuration() -> String {
        Double(self).toDuration()
    }
}
