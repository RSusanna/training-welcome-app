
import UIKit

enum TextFieldType {
    case username
    case email
    case password
    
    var title: String {
        switch self {
        case .username:
            return "Username"
        case .email:
            return "Enter your email"
        case .password:
            return "Enter your password"
        }
    }
}

final class AppTextField: UITextField {
    
    private let fieldType: TextFieldType
    
    init(fieldType: TextFieldType) {
        self.fieldType = fieldType
        super.init(frame: .zero)
        self.placeholder = fieldType.title
        self.layer.cornerRadius = 8
        self.textColor = UIColor.darkGray
        self.backgroundColor = UIColor.verylightGrayColor
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
