//
//  Double+Extensions.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/18/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import Foundation

extension Double {
    func toString(fractionDigits: Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = fractionDigits
        
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
