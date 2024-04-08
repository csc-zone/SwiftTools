import SwiftUI

public struct RectIconView: View {
    
    let systemName: String
    let name: String
    let bg: Color
    
    public init(name: String, bg: Color) {
        self.systemName = name
        self.name = ""
        self.bg = bg
    }

    public init(_ name: String, bg: Color) {
        self.systemName = ""
        self.name = name
        self.bg = bg
    }
    
    public var body: some View {
        if systemName.isEmpty {
            Image(name: name)
                .resizable()
                .scaledToFit()
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Color.white)
                .frame(width: 18, height: 18)
                .padding(6)
                .background(bg)
                .cornerRadius(8.0)
        } else {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Color.white)
                .frame(width: 18, height: 18)
                .padding(6)
                .background(bg)
                .cornerRadius(8.0)
        }
    }
}