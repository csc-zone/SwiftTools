import SwiftUI

public struct RectIconView: View {
    
    let name: String
    let bg: Color
    
    public init(name: String, bg: Color) {
        self.name = name
        self.bg = bg
    }
    
    public var body: some View {
        Image(systemName: name)
            .resizable()
            .scaledToFit()
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(Color.white)
            .padding(6)
            .background(bg)
            .cornerRadius(8.0)
            
    }
}