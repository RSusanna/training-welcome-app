import UIKit

extension AppTextField {
    struct Constants {
        let fieldInset: UIEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 50)
        let cornerRadiusOfTextField = 8
        let borderWidthOfTextField = 1
    }
}

enum TextFieldType {
    case username
    case email
    case password
    case confirmPassword
    
    var title: String {
        switch self {
        case .username:
            return "Username"
        case .email:
            return "Enter your email"
        case .password:
            return "Enter your password"
        case .confirmPassword:
            return "Confirm password"
        }
    }
}

final class AppTextField: UITextField {
    
    private let fieldType: TextFieldType
    
    private let constants: Constants
    
    private lazy var eyeButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapEye), for: .touchUpInside)
        button.setImage(UIImage(named: "eye")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    private var isShowText: Bool = false {
        didSet {
            if isShowText {
                self.isSecureTextEntry = true
            } else {
                self.isSecureTextEntry = false
            }
        }
    }
    init(fieldType: TextFieldType) {
        self.fieldType = fieldType
        self.constants = Constants()
        super.init(frame: .zero)
        setupField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: constants.fieldInset)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: constants.fieldInset)
    }

    override func editingRect(forBounds bounds: CGRect) ->  CGRect {
        return bounds.inset(by: constants.fieldInset)
    }

}

    private extension AppTextField {
        @objc func didTapEye() {
            isShowText.toggle()
        }

        func setupField() {
            self.placeholder = fieldType.title
            self.layer.cornerRadius = CGFloat(Constants().cornerRadiusOfTextField)
            self.textColor = UIColor.darkGray
            self.backgroundColor = UIColor.verylightGrayColor
            self.layer.borderWidth = CGFloat(Constants().borderWidthOfTextField)
            self.layer.borderColor = UIColor.darkGray.cgColor
            self.autocorrectionType = .no
            self.autocapitalizationType = .none
    
    switch fieldType {
    case .username:
        break
    case .email:
        self.keyboardType = .emailAddress
    case .password:
        self.isSecureTextEntry = true
        self.addSubview(eyeButton)
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eyeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            eyeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    case .confirmPassword:
        self.isSecureTextEntry = true
        }
    }
}
