//
//  Item.swift
//  SDCSV01
//
//  Created by hiro on 2024/03/19.
//

import Foundation
import SwiftData

@Model
final class DeviceName {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
