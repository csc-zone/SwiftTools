//
//  File.swift
//  
//
//  Created by baby on 2023/7/10.
//

import Foundation

public func isLink(_ str: String) -> Bool {
    if let url = URL(string: str), url.scheme == "http" || url.scheme == "https" {
        return true
    }
    return false
}

public func generateObjectId() -> String {
    let time = String(Int(Date().timeIntervalSince1970), radix: 16, uppercase: false)
    let machine = String(Int.random(in: 100000 ..< 999999))
    let pid = String(Int.random(in: 1000 ..< 9999))
    let counter = String(Int.random(in: 100000 ..< 999999))
    return time + machine + pid + counter
}

public func localizedString(_ text: String) -> String {
    return NSLocalizedString(text, comment: "")
}
