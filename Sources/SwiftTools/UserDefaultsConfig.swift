//
//  File.swift
//  
//
//  Created by baby on 2023/7/10.
//

import Foundation

@propertyWrapper
public struct UserDefaultWrapper<T> {
    let key: String
    let defaultValue: T
    let userDefaults: UserDefaults

    public init(_ key: String, defaultValue: T, suiteName: String = "") {
        self.key = key
        self.defaultValue = defaultValue
        if suiteName.isEmpty {
            self.userDefaults = UserDefaults.standard
        } else {
            self.userDefaults = UserDefaults(suiteName: suiteName) ?? UserDefaults.standard
        }
        
    }

    public var wrappedValue: T {
        get {
            return userDefaults.object(forKey: key) as? T ?? defaultValue
        }
        set {
            userDefaults.setValue(newValue, forKey: key)
        }
    }
}
