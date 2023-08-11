import UIKit

enum AppColor: UInt {
    case lightBlueUIColor = 0x35C2C1
    case darkBlueUIColor = 0x1E232C
    case lightGrayUIColor = 0xE8ECF4
    case verylightGrayColor = 0xF7F8F9
    
    var color: UIColor {
        return UIColor(rgb: self.rawValue)
    }
}
