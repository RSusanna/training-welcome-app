import UIKit

protocol LogInViewDelegate: AnyObject {
    func didTapRegister()
}
    //MARK: - константы
extension LogInView {
    struct ConstantsForLogInView {
        let darkColor = AppColor.darkBlueUIColor.color
        let lightBlueColor = AppColor.lightBlueUIColor.color
        
        let backgroundImage: UIImage? = UIImage(named: "backgroundImage")
        let logoImage: UIImage? = UIImage(named: "Branding")
        
        let standartSidePadding: CGFloat = 22.0
        let topConstraintForText: CGFloat = 125.0
        let topStandartConstraint: CGFloat = 15.0
        let topDoubleConstraint: CGFloat = 30
        let topConstraintForSocialMedia: CGFloat = 75.0
        let smallIndent: CGFloat = 5.0
        let lineHeight: CGFloat = 1.0
        let standartHeight: CGFloat = 56.0
        let borderWidht: CGFloat = 1.0
        let grayColor = UIColor(red: 0.91, green: 0.925, blue: 0.957, alpha: 1)
        let darkBlueColor = UIColor(red: 0.118, green: 0.137, blue: 0.173, alpha: 1)
    }
}

final class LogInView: BaseView {
    
    private let constants: ConstantsForLogInView

    weak var delegate: LogInViewDelegate?
    
    //MARK: - вьюшки
    private lazy var leftLine: UIView = {
        let view = createLineView()
        return view
    }()
    private lazy var rightLine: UIView = {
        let view = createLineView()
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

    private let emailTextField: UITextField = {
        let view = AppTextField(fieldType: .email)
        return view
    }()
    
    private let passwordTextField: UITextField = {
        let view = AppTextField(fieldType: .password)
       return view
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
        let attributesOfFirstPart = [NSAttributedString.Key.foregroundColor : UIColor.black]
        //firstPartOfText
        var FirstPartOfText = NSMutableAttributedString(string: "Don’t have an account? ", attributes: attributesOfFirstPart)
        let attributesOfSecondPart = [NSAttributedString.Key.foregroundColor : constants.lightBlueColor]
        let secondPartOfText = NSAttributedString(string: " Register now", attributes: attributesOfSecondPart)
        
        FirstPartOfText.append(secondPartOfText)
        
        let textInformation =  createMainButton(title: "", titleColor: .darkGray, font: .semibold15, backgroundColor: .white)
        textInformation.setAttributedTitle(FirstPartOfText, for: .normal)
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
    private lazy var socialMesiaStackView: UIStackView = {
        let stack = toStackView(subviews: [googleButton,
                                           faceButton,
                                           appleButton],
                                axis: .horizontal, spacing: 8, alignment: .fill, distribution: .fillEqually)
        return stack
    }()

    //MARK: - init'ы
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        self.constants = ConstantsForLogInView()
        super.init(frame: frame)
        welcomeText.textColor = constants.darkBlueColor
        forgotPasswordButton.titleLabel?.textColor = constants.grayColor
        logInButton.backgroundColor = constants.darkBlueColor
        googleButton.clipsToBounds = true
        faceButton.clipsToBounds = true
        appleButton.clipsToBounds = true
        addViews()
        setupViewsConstraints()
    }
    
    deinit {
        print("DEINT")
    }
}

private extension LogInView {
    @objc func actionRegisterButton(){
        delegate?.didTapRegister()
    }
    
    //MARK: - Добавление
    func addViews() {
        [welcomeText, orLogInWithText, dontHaveAccText, emailTextField, passwordTextField,
         forgotPasswordButton, logInButton, socialMesiaStackView,
         leftLine, rightLine].forEach({ self.addSubview($0) })
    }
    
    //MARK: - настройка констрейнтов
    func setupViewsConstraints() {
        welcomeText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            welcomeText.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                 constant: constants.standartSidePadding),
            welcomeText.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                  constant: -constants.standartSidePadding),
            welcomeText.topAnchor.constraint(equalTo: self.topAnchor,
                                             constant: constants.topConstraintForText)
        ])
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constants.standartSidePadding),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -constants.standartSidePadding),
            emailTextField.topAnchor.constraint(equalTo: self.welcomeText.bottomAnchor, constant: constants.topDoubleConstraint),
            emailTextField.heightAnchor.constraint(equalToConstant: constants.standartHeight)
        ])
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                       constant: constants.standartSidePadding),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                        constant: -constants.standartSidePadding),
            passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor,
                                                   constant: constants.topStandartConstraint),
            passwordTextField.heightAnchor.constraint(equalToConstant: constants.standartHeight)
        ])
        
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forgotPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                           constant:  -constants.standartSidePadding),
            forgotPasswordButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor,
                                                      constant: constants.topStandartConstraint)
        ])
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                       constant: constants.standartSidePadding),
            logInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                        constant: -constants.standartSidePadding),
            logInButton.topAnchor.constraint(equalTo: self.forgotPasswordButton.bottomAnchor,
                                             constant: constants.topStandartConstraint),
            logInButton.heightAnchor.constraint(equalToConstant: constants.standartHeight)
        ])
        orLogInWithText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orLogInWithText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            orLogInWithText.topAnchor.constraint(equalTo: self.logInButton.bottomAnchor,
                                                 constant:constants.topStandartConstraint)
            ])
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftLine.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                              constant: constants.standartSidePadding),
            leftLine.trailingAnchor.constraint(equalTo: self.orLogInWithText.leadingAnchor,
                                               constant: -constants.smallIndent),
            leftLine.topAnchor.constraint(equalTo: self.logInButton.bottomAnchor,
                                             constant: constants.topStandartConstraint),
            leftLine.heightAnchor.constraint(equalToConstant: constants.lineHeight)
        ])
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightLine.leadingAnchor.constraint(equalTo: self.orLogInWithText.trailingAnchor,
                                              constant: constants.smallIndent),
            rightLine.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                               constant: -constants.standartHeight),
            rightLine.topAnchor.constraint(equalTo: self.logInButton.bottomAnchor,
                                             constant: constants.topStandartConstraint),
            rightLine.heightAnchor.constraint(equalToConstant: constants.lineHeight)
            ])
        socialMesiaStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            socialMesiaStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                          constant: constants.standartSidePadding),
            socialMesiaStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                           constant: -constants.standartSidePadding),
            socialMesiaStackView.heightAnchor.constraint(equalToConstant: constants.standartHeight),
            socialMesiaStackView.bottomAnchor.constraint(equalTo: self.orLogInWithText.bottomAnchor,
                                                         constant: constants.topConstraintForSocialMedia)
            ])
        dontHaveAccText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dontHaveAccText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dontHaveAccText.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])


    }
}

