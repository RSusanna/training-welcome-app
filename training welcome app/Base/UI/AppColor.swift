import UIKit

enum AppColor: UInt {
    case lightBlue = 0x35C2C1
    case darkColor = 0x1E232C
    case borderLightGray = 0xE8ECF4
    
    var color: UIColor {
        return UIColor(rgb: self.rawValue)
    }
}
