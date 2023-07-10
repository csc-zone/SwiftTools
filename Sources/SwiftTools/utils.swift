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
