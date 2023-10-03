
import Foundation

public extension TimeInterval {
    
    func stringFromTimeInterval(_ format: String="%0.2d:%0.2d:%0.2d") -> String {
        let time = NSInteger(self)
        let ms = Int((self.truncatingRemainder(dividingBy: 1)) * 1000)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)

        return String(format: format, hours, minutes,seconds)
    }
}