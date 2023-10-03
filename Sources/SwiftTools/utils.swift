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

public func matchStrings(_ string: String, pattern: String) -> Bool {
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: string.utf16.count)
        return regex.firstMatch(in: string, options: [], range: range) != nil
    } catch {
        print("Error creating regex: \(error)")
        return false
    }
}

public func convertCookieStringToDictionary(_ cookieString: String) -> [String: Any] {
    var cookieDict: [String: Any] = [:]
    
    let cookieSegments = cookieString.split(separator: ";")
    
    for segment in cookieSegments {
        let keyValue = segment.split(separator: "=", maxSplits: 1)
        
        if keyValue.count == 2 {
            let key = String(keyValue[0]).trimmingCharacters(in: .whitespaces)
            let value = String(keyValue[1]).trimmingCharacters(in: .whitespaces)
            
            cookieDict[key] = value
        }
    }
    
    return cookieDict
}

public func convertDictionaryToCookieString(_ dictionary: [String: Any]) -> String {
    var cookieString = ""
    
    for (key, value) in dictionary {
        let keyValueString = "\(key)=\(value)"
        cookieString += keyValueString + "; "
    }
    
    // Remove the trailing semicolon and space
    cookieString = String(cookieString.dropLast(2))
    
    return cookieString
}
