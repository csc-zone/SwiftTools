//
//  File.swift
//  
//
//  Created by baby on 2023/7/10.
//

import Foundation
import SwiftUI
import CommonCrypto

public extension String {

    var md5: String {
        let data = Data(self.utf8)
        let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
            var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
            return hash
        }
        return hash.map { String(format: "%02x", $0) }.joined()
    }

    var localizedName: LocalizedStringKey {
        return LocalizedStringKey(self)
    }

    func droppingLeadingPoundSign() -> String {
        if starts(with: "#") {
            return String(dropFirst())
        }
        return self
    }
    
    func removePrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    func inserting(separator: String, every n: Int) -> String {
        var result: String = ""
        let characters = Array(self)
        stride(from: 0, to: characters.count, by: n).forEach {
            result += String(characters[$0..<min($0+n, characters.count)])
            if $0+n < characters.count {
                result += separator
            }
        }
        return result
    }
    
    var isNumeric: Bool {
        return !(self.isEmpty) && self.allSatisfy { $0.isNumber }
    }
    
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }

    var fileURL: URL {
        return URL(fileURLWithPath: self)
    }

    var toURL: URL? {
        return URL(string: self)
    }

    var pathExtension: String {
        return fileURL.pathExtension
    }
    
    var lastPathComponent: String {
        return fileURL.lastPathComponent
    }

    var lessLastPathComponent: String {
        return fileURL.deletingPathExtension().lastPathComponent
    }

    func base64Encoded() -> String? {
        data(using: .utf8)?.base64EncodedString()
    }

    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }

    var isVideoFile: Bool {
        let videoExtensions = ["mp4", "mov", "avi", "mkv", "flv", "wmv", "webm", "3gp"]
        let lowercasedFileName = self.lowercased()
        
        return videoExtensions.contains { extensionSuffix in
            lowercasedFileName.hasSuffix(extensionSuffix)
        }
    }

    var nameWithoutSuffix: String {
        guard let lastDotIndex = self.lastIndex(of: ".") else {
            return self
        }

        return String(self.prefix(upTo: lastDotIndex))
    }

    var isSubtitleFile: Bool {
        let subtitleExtensions = [".srt", ".sub", ".ass", ".vtt", ".ssa", ".ttml"] // Add more extensions if needed
        let lowercasedFileName = self.lowercased()
        
        return subtitleExtensions.contains { extensionSuffix in
            lowercasedFileName.hasSuffix(extensionSuffix)
        }
    }
    
    var isNumber: Bool {
        return self.range(
            of: "^[0-9]*$", // 1
            options: .regularExpression) != nil
    }

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
