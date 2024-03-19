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
    var device: String
    var screenSize: String
    
    init(device: String, screenSize: String) {
        self.device = device
        self.screenSize = screenSize
    }
}
