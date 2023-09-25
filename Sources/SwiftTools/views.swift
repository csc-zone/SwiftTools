//
//  File.swift
//  
//
//  Created by baby on 2023/7/10.
//

import Foundation
import SwiftUI

public extension View {
    @ViewBuilder func ifIs<T>(_ condition: Bool, transform: (Self) -> T) -> some View where T: View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder func ifElse<T:View,V:View>( _ condition:Bool,isTransform:(Self) -> T,elseTransform:(Self) -> V) -> some View {
        if condition {
            isTransform(self)
        } else {
            elseTransform(self)
        }
    }
}

public struct DeferView<Content: View>: View {
    let content: () -> Content

    public init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        content()
    }
}

public struct ChevronView: View {
//    @State var fg: Color = Color(UIColor.systemGray3)

    public init() {}
    
    public var body: some View {
        #if !os(macOS)
        Image(systemName: "chevron.right")
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(Color(UIColor.systemGray3))
        #else
        EmptyView()
        #endif
    }
}

