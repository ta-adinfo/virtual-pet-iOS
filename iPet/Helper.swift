//
//  Helper.swift
//  iPet
//
//  Created by emanuel primavera on 29/10/23.
//

import Foundation

func calculateTimeSince(data: Date) -> Int {
    let seconds = Int(-data.timeIntervalSinceNow)
    return seconds
}
