
import UIKit

enum TextFieldType {
    case username
    case email
    
    var title: String {
        switch self {
        case .username:
            return "Username"
        case .email:
            return "Email"
        }
    }
}

final class AppTextField: UITextField {
    
    private let fieldType: TextFieldType
    
    init(fieldType: TextFieldType) {
        self.fieldType = fieldType
        super.init(frame: .zero)
        self.placeholder = fieldType.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
