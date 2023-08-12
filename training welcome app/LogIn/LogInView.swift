import UIKit

final class LogInView: BaseView {
    
    weak var delegate: ShowNewViewProtocol?
    
    //MARK: - цвета экрана
    private let grayColor: UIColor = {
        let color = UIColor(red: 0.91, green: 0.925, blue: 0.957, alpha: 1)
        return color
    }()
    private let darkBlueColor: UIColor = {
        let color = UIColor(red: 0.118, green: 0.137, blue: 0.173, alpha: 1)
        return color
    }()
    //MARK: - вьюшки
    private let leftLine: UIView = {
        let view = UIView()
        return view
    }()
    private let rightLine: UIView = {
        let view = UIView()
        return view
    }()

    //MARK: - текст
    private lazy var welcomeText: UILabel = {
        let label = createMainUILabel(text: "Welcome back! Glad to see you, Again!")
        return label
    }()
    private let orLogInWithText: UILabel = {
        var textInformation =  UILabel()
        textInformation.text = "Or Login with"
        textInformation.font = UIFont(name: "HelveticaNeue", size: 14)
        textInformation.textColor = .black
        return textInformation
    }()

    //MARK: - Текстфилды

    let emailTextField: UITextField = {
        let view = AppTextField(fieldType: .email)
        return view
    }()
    let passwordTextField: UITextField = {
        let view = AppTextField(fieldType: .password)
       return view
    }()
    // Создаем кнопку для переключения видимости текста
    private lazy var toggleButton: UIButton = {
        toggleButton = UIButton(type: .custom)
        toggleButton.setImage(UIImage(named: "openEye"), for: .normal)
        toggleButton.setImage(UIImage(named: "eye"), for: .selected)
        toggleButton.frame = CGRect(x: 0, y: 0, width: 8, height: 8)
        toggleButton.addTarget(self, action: #selector(toggleVisibility(_:)), for: .touchUpInside)
    return toggleButton
    }()
    //MARK: - кнопки
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = createMainButton(title: "Forgot Password?", titleColor: .darkGray, font: .semibold15.withSize(14), backgroundColor: .white)
        return button
    }()
    private lazy var logInButton: UIButton = {
        let button = createMainButton(title: "Login", titleColor: .white, font: .semibold15, backgroundColor: .darkBlue)
        return button
    }()
    private lazy var dontHaveAccText: UIButton = {
        let textInformation =  createMainButton(title: "Don’t have an account? Register Now", titleColor: .darkGray, font: .semibold15, backgroundColor: .white)
        //открытие новой вьюшки
        textInformation.addTarget(self, action: #selector(actionRegisterButton), for: .touchUpInside)
        return textInformation
    }()

    private lazy var googleButton: UIButton = {
        let button = createImageButton(imageName: "google", borderColor: .lightGray)
        return button
    }()
    private lazy var appleButton: UIButton = {
        let button = createImageButton(imageName: "apple", borderColor: .lightGray)
        return button
    }()
    private lazy var faceButton: UIButton = {
        let button = createImageButton(imageName: "facebook", borderColor: .lightGray)
        return button
    }()
    //MARK: - Картинка лого
//    private let brandImage: UIImageView = {
//        let image: UIImage
//        return
//    }()
    
    //MARK: - init'ы
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        welcomeText.textColor = darkBlueColor
        emailTextField.backgroundColor = grayColor
        passwordTextField.backgroundColor = grayColor
        forgotPasswordButton.titleLabel?.textColor = grayColor
        logInButton.backgroundColor = darkBlueColor
        googleButton.clipsToBounds = true
        faceButton.clipsToBounds = true
        appleButton.clipsToBounds = true
        leftLine.backgroundColor = grayColor
        rightLine.backgroundColor = grayColor
        passwordTextField.rightView = toggleButton
        passwordTextField.rightView?.frame(forAlignmentRect: .init(x: 0, y: 0, width: 9, height: 9))
        passwordTextField.rightViewMode = .always
    }
    

    //MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
        setupViewsConstraints()
    }
    
    //MARK: - Добавление
    private func addViews(){
        self.addSubview(welcomeText)
        self.addSubview(orLogInWithText)
        self.addSubview(dontHaveAccText)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(forgotPasswordButton)
        self.addSubview(logInButton)
        self.addSubview(googleButton)
        self.addSubview(appleButton)
        self.addSubview(faceButton)
        self.addSubview(leftLine)
        self.addSubview(rightLine)        
    }
    //MARK: - настройка констрейнтов
    private func setupViewsConstraints() {
        welcomeText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            welcomeText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            welcomeText.topAnchor.constraint(equalTo: self.topAnchor, constant: 125),
            welcomeText.widthAnchor.constraint(equalToConstant: 280),
            welcomeText.heightAnchor.constraint(equalToConstant: 78)
        ])
        orLogInWithText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orLogInWithText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 146),
            orLogInWithText.topAnchor.constraint(equalTo: self.topAnchor, constant: 515),
            orLogInWithText.widthAnchor.constraint(equalToConstant: 84),
            orLogInWithText.heightAnchor.constraint(equalToConstant: 17)
            ])
        dontHaveAccText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dontHaveAccText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 61),
            dontHaveAccText.topAnchor.constraint(equalTo: self.topAnchor, constant: 765),
        ])
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            emailTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 235),
            emailTextField.widthAnchor.constraint(equalToConstant: 331),
            emailTextField.heightAnchor.constraint(equalToConstant: 51)
        ])
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            passwordTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 306),
            passwordTextField.widthAnchor.constraint(equalToConstant: 331),
            passwordTextField.heightAnchor.constraint(equalToConstant: 51)
            ])
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forgotPasswordButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 242),
            forgotPasswordButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 377),
            forgotPasswordButton.widthAnchor.constraint(equalToConstant: 111),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 17)
        ])
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            logInButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 424),
            logInButton.widthAnchor.constraint(equalToConstant: 331),
            logInButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        faceButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            faceButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 59),
            faceButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 569),
            faceButton.widthAnchor.constraint(equalToConstant: 50),
            faceButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            googleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 172),
            googleButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 569),
            googleButton.widthAnchor.constraint(equalToConstant: 50),
            googleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 285),
            appleButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 569),
            appleButton.widthAnchor.constraint(equalToConstant: 50),
            appleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        leftLine.frame = CGRect(x: 22, y: 524, width: 112, height: 1)
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        rightLine.frame = CGRect(x: 242, y: 524, width: 112, height: 1)
    }
    //скрытие текста у текстфилда
    @objc func toggleVisibility(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTextField.isSecureTextEntry = !sender.isSelected
    }
}
//открытие нового вью
private extension LogInView {
    @objc func actionRegisterButton(){
        delegate?.showNewView(VC: logInViewController())
    }
}

