//
//  File.swift
//  
//
//  Created by baby on 2023/7/10.
//

import Foundation
import SwiftUI

public extension UIColor {
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
    
    func toHex(alpha: Bool = false) -> String? {
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }
        
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        
        if components.count >= 4 {
            a = Float(components[3])
        }
        
        if alpha {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}

public extension Color {
    init(hex: String) {
        let hex = hex.droppingLeadingPoundSign()
        var rgbValue: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgbValue)

        self.init(
            red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgbValue & 0x0000FF) / 255.0
        )
    }

    func toHex(alpha: Bool = false) -> String? {
        UIColor(self).toHex(alpha: alpha)
    }
}

public struct Theme {
    public static var stone50 = SwiftUI.Color(hex: "#fafaf9")
    public static var stone100 = SwiftUI.Color(hex: "#f5f5f4")
    public static var stone200 = SwiftUI.Color(hex: "#e7e5e4")
    public static var stone300 = SwiftUI.Color(hex: "#d6d3d1")
    public static var stone400 = SwiftUI.Color(hex: "#a8a29e")
    public static var stone500 = SwiftUI.Color(hex: "#78716c")
    public static var stone600 = SwiftUI.Color(hex: "#57534e")
    public static var stone700 = SwiftUI.Color(hex: "#44403c")
    public static var stone800 = SwiftUI.Color(hex: "#292524")
    public static var stone900 = SwiftUI.Color(hex: "#1c1917")
    
    public static var gray50 = SwiftUI.Color(hex: "#f9fafb")
    public static var gray100 = SwiftUI.Color(hex: "#f4f5f7")
    public static var gray200 = SwiftUI.Color(hex: "#e5e7eb")
    public static var gray300 = SwiftUI.Color(hex: "#d2d6dc")
    public static var gray400 = SwiftUI.Color(hex: "#9fa6b2")
    public static var gray500 = SwiftUI.Color(hex: "#6b7280")
    public static var gray600 = SwiftUI.Color(hex: "#4b5563")
    public static var gray700 = SwiftUI.Color(hex: "#374151")
    public static var gray800 = SwiftUI.Color(hex: "#252f3f")
    public static var gray900 = SwiftUI.Color(hex: "#161e2e")

    public static var sky50 = SwiftUI.Color(hex: "#f0f9ff")
    public static var sky100 = SwiftUI.Color(hex: "#e0f2fe")
    public static var sky200 = SwiftUI.Color(hex: "#bae6fd")
    public static var sky300 = SwiftUI.Color(hex: "#7dd3fc")
    public static var sky400 = SwiftUI.Color(hex: "#38bdf8")
    public static var sky500 = SwiftUI.Color(hex: "#0ea5e9")
    public static var sky600 = SwiftUI.Color(hex: "#0284c7")
    public static var sky700 = SwiftUI.Color(hex: "#0369a1")
    public static var sky800 = SwiftUI.Color(hex: "#075985")
    public static var sky900 = SwiftUI.Color(hex: "#0c4a6e")
    
    public static var red50 = SwiftUI.Color(hex: "#fdf2f2")
    public static var red100 = SwiftUI.Color(hex: "#fde8e8")
    public static var red200 = SwiftUI.Color(hex: "#fbd5d5")
    public static var red300 = SwiftUI.Color(hex: "#f8b4b4")
    public static var red400 = SwiftUI.Color(hex: "#f98080")
    public static var red500 = SwiftUI.Color(hex: "#f05252")
    public static var red600 = SwiftUI.Color(hex: "#e02424")
    public static var red700 = SwiftUI.Color(hex: "#c81e1e")
    public static var red800 = SwiftUI.Color(hex: "#9b1c1c")
    public static var red900 = SwiftUI.Color(hex: "#771d1d")

    public static var orange50 = SwiftUI.Color(hex: "#fff8f1")
    public static var orange100 = SwiftUI.Color(hex: "#feecdc")
    public static var orange200 = SwiftUI.Color(hex: "#fcd9bd")
    public static var orange300 = SwiftUI.Color(hex: "#fdba8c")
    public static var orange400 = SwiftUI.Color(hex: "#ff8a4c")
    public static var orange500 = SwiftUI.Color(hex: "#ff5a1f")
    public static var orange600 = SwiftUI.Color(hex: "#d03801")
    public static var orange700 = SwiftUI.Color(hex: "#b43403")
    public static var orange800 = SwiftUI.Color(hex: "#8a2c0d")
    public static var orange900 = SwiftUI.Color(hex: "#73230d")

    public static var yellow50 = SwiftUI.Color(hex: "#fdfdea")
    public static var yellow100 = SwiftUI.Color(hex: "#fdf6b2")
    public static var yellow200 = SwiftUI.Color(hex: "#fce96a")
    public static var yellow300 = SwiftUI.Color(hex: "#faca15")
    public static var yellow400 = SwiftUI.Color(hex: "#e3a008")
    public static var yellow500 = SwiftUI.Color(hex: "#c27803")
    public static var yellow600 = SwiftUI.Color(hex: "#9f580a")
    public static var yellow700 = SwiftUI.Color(hex: "#8e4b10")
    public static var yellow800 = SwiftUI.Color(hex: "#723b13")
    public static var yellow900 = SwiftUI.Color(hex: "#633112")

    public static var green50 = SwiftUI.Color(hex: "#f3faf7")
    public static var green100 = SwiftUI.Color(hex: "#def7ec")
    public static var green200 = SwiftUI.Color(hex: "#bcf0da")
    public static var green300 = SwiftUI.Color(hex: "#84e1bc")
    public static var green400 = SwiftUI.Color(hex: "#31c48d")
    public static var green500 = SwiftUI.Color(hex: "#0e9f6e")
    public static var green600 = SwiftUI.Color(hex: "#057a55")
    public static var green700 = SwiftUI.Color(hex: "#046c4e")
    public static var green800 = SwiftUI.Color(hex: "#03543f")
    public static var green900 = SwiftUI.Color(hex: "#014737")

    public static var teal50 = SwiftUI.Color(hex: "#edfafa")
    public static var teal100 = SwiftUI.Color(hex: "#d5f5f6")
    public static var teal200 = SwiftUI.Color(hex: "#afecef")
    public static var teal300 = SwiftUI.Color(hex: "#7edce2")
    public static var teal400 = SwiftUI.Color(hex: "#16bdca")
    public static var teal500 = SwiftUI.Color(hex: "#0694a2")
    public static var teal600 = SwiftUI.Color(hex: "#047481")
    public static var teal700 = SwiftUI.Color(hex: "#036672")
    public static var teal800 = SwiftUI.Color(hex: "#05505c")
    public static var teal900 = SwiftUI.Color(hex: "#014451")

    public static var blue50 = SwiftUI.Color(hex: "#ebf5ff")
    public static var blue100 = SwiftUI.Color(hex: "#e1effe")
    public static var blue200 = SwiftUI.Color(hex: "#c3ddfd")
    public static var blue300 = SwiftUI.Color(hex: "#a4cafe")
    public static var blue400 = SwiftUI.Color(hex: "#76a9fa")
    public static var blue500 = SwiftUI.Color(hex: "#3f83f8")
    public static var blue600 = SwiftUI.Color(hex: "#1c64f2")
    public static var blue700 = SwiftUI.Color(hex: "#1a56db")
    public static var blue800 = SwiftUI.Color(hex: "#1e429f")
    public static var blue900 = SwiftUI.Color(hex: "#233876")

    public static var indigo50 = SwiftUI.Color(hex: "#f0f5ff")
    public static var indigo100 = SwiftUI.Color(hex: "#e5edff")
    public static var indigo200 = SwiftUI.Color(hex: "#cddbfe")
    public static var indigo300 = SwiftUI.Color(hex: "#b4c6fc")
    public static var indigo400 = SwiftUI.Color(hex: "#8da2fb")
    public static var indigo500 = SwiftUI.Color(hex: "#6875f5")
    public static var indigo600 = SwiftUI.Color(hex: "#5850ec")
    public static var indigo700 = SwiftUI.Color(hex: "#5145cd")
    public static var indigo800 = SwiftUI.Color(hex: "#42389d")
    public static var indigo900 = SwiftUI.Color(hex: "#362f78")

    public static var purple50 = SwiftUI.Color(hex: "#f6f5ff")
    public static var purple100 = SwiftUI.Color(hex: "#edebfe")
    public static var purple200 = SwiftUI.Color(hex: "#dcd7fe")
    public static var purple300 = SwiftUI.Color(hex: "#cabffd")
    public static var purple400 = SwiftUI.Color(hex: "#ac94fa")
    public static var purple500 = SwiftUI.Color(hex: "#9061f9")
    public static var purple600 = SwiftUI.Color(hex: "#7e3af2")
    public static var purple700 = SwiftUI.Color(hex: "#6c2bd9")
    public static var purple800 = SwiftUI.Color(hex: "#5521b5")
    public static var purple900 = SwiftUI.Color(hex: "#4a1d96")

    public static var pink50 = SwiftUI.Color(hex: "#fdf2f8")
    public static var pink100 = SwiftUI.Color(hex: "#fce8f3")
    public static var pink200 = SwiftUI.Color(hex: "#fad1e8")
    public static var pink300 = SwiftUI.Color(hex: "#f8b4d9")
    public static var pink400 = SwiftUI.Color(hex: "#f17eb8")
    public static var pink500 = SwiftUI.Color(hex: "#e74694")
    public static var pink600 = SwiftUI.Color(hex: "#d61f69")
    public static var pink700 = SwiftUI.Color(hex: "#bf125d")
    public static var pink800 = SwiftUI.Color(hex: "#99154b")
    public static var pink900 = SwiftUI.Color(hex: "#751a3d")
    
    
    public static var github100 = SwiftUI.Color(hex: "#9be9a8")
    public static var github300 = SwiftUI.Color(hex: "#40c463")
    public static var github500 = SwiftUI.Color(hex: "#30a14e")
    public static var github700 = SwiftUI.Color(hex: "#216e39")
    
    public static var blackCoffee = SwiftUI.Color(hex: "#1d1817")
    public static var blackChocolate = SwiftUI.Color(hex: "#1b1811")
    public static var blackCynical = SwiftUI.Color(hex: "#171717")
    public static var blackGlossy = SwiftUI.Color(hex: "#110011")
    public static var blackMetropolis = SwiftUI.Color(hex: "#1a1a1a")
    public static var blackNight = SwiftUI.Color(hex: "#1c1c1c")
    public static var blackPot = SwiftUI.Color(hex: "#161616")
    public static var blackVoid = SwiftUI.Color(hex: "#010207")
    public static var blackChestnut = SwiftUI.Color(hex: "#111016")
    public static var blackCarbon = SwiftUI.Color(hex: "#333333")
}
