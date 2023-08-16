import UIKit
//MARK: - Константы
extension RegisterView {
    struct ConstantsForRegisterView {
    let radiusOfViews = 8
        let standartSidePadding: CGFloat = 22.0
        let standartHeight: CGFloat = 56.0
        let smallIndent: CGFloat = 5.0
        let topStandartConstraint: CGFloat = 15.0
        let lineHeight: CGFloat = 1.0
        let topConstraintForText: CGFloat = 125.0
        let lightBlueColor = AppColor.lightBlueUIColor.color
    }
}

final class RegisterView: BaseView {
    
    private let constants: ConstantsForRegisterView
    
    //MARK: - UILAbel
    private lazy var mainText: UILabel = {
       let text = createMainUILabel(text: "Hello! Register to get started")
        return text
    }()
    private lazy var orLogInWithText: UIButton = {
        let attributesOfFirstPart = [NSAttributedString.Key.foregroundColor : UIColor.black]
        //firstPartOfText
        var FirstPartOfText = NSMutableAttributedString(string: "Already have an account?", attributes: attributesOfFirstPart)
        let attributesOfSecondPart = [NSAttributedString.Key.foregroundColor : constants.lightBlueColor]
        let secondPartOfText = NSAttributedString(string: " Login now", attributes: attributesOfSecondPart)
        
        FirstPartOfText.append(secondPartOfText)
        
        let textInformation =  createMainButton(title: "", titleColor: .darkGray, font: .semibold15, backgroundColor: .white)
        textInformation.setAttributedTitle(FirstPartOfText, for: .normal)
//        textInformation.addTarget(self, action: #selector(actionRegisterButton), for: .touchUpInside)
        return textInformation
    }()
    
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
    private let orRegisterText: UILabel = {
        var textInformation =  UILabel()
        textInformation.text = "Or Register with"
        textInformation.font = UIFont(name: "HelveticaNeue", size: 14)
        textInformation.textColor = .black
        return textInformation
    }()
    //MARK: - кнопки
    
    private lazy var toRegisterButton: UIButton = {
        let button = createMainButton(title: "Register", titleColor: .white, font: .semibold15, backgroundColor: .darkBlue, radius: 8)
        return button
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

    private lazy var verticalStackView: UIStackView = {
        let stack = toStackView(subviews: [userNameTextField,
                                           emailTextField,
                                           passwordTextField,
                                           confirmTextField,
                                           toRegisterButton],
                                axis: .vertical,
                                spacing: 12,
                                alignment: .fill,
                                distribution: .fillEqually)
        return stack
    }()

    //MARK: - Текстфилды
    let userNameTextField: UITextField = {
        let view = AppTextField(fieldType: .username)
        return view
    }()
    let emailTextField: UITextField = {
        let view = AppTextField(fieldType: .email)
        return view
    }()
    let passwordTextField: UITextField = {
        let view = AppTextField(fieldType: .password)
       return view
    }()
    let confirmTextField: UITextField = {
        let view = AppTextField(fieldType: .confirmPassword)
        return view
    }()
    //MARK: - Инит
    init() {
        self.constants = ConstantsForRegisterView()
        super.init(frame: .zero)
        addViews()
        setupViewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("DEINT")
    }
    
    //MARK: - Добавление
    private func addViews(){
        [mainText, orLogInWithText, leftLine, rightLine, verticalStackView, socialMesiaStackView, orRegisterText].forEach({self.addSubview($0) })
    }
    //MARK: - констрейнты
    func setupViewsConstraints() {
        mainText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainText.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                              constant: constants.standartSidePadding),
            mainText.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                               constant: -constants.standartSidePadding),
            mainText.topAnchor.constraint(equalTo: self.topAnchor,
                                             constant: constants.topConstraintForText)
        ])
        
        verticalStackView.arrangedSubviews.forEach({ $0.heightAnchor.constraint(equalToConstant: constants.standartHeight).isActive = true })
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                       constant: constants.standartSidePadding),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                        constant: -constants.standartSidePadding),
            verticalStackView.topAnchor.constraint(equalTo: mainText.bottomAnchor,
                                                   constant: constants.standartHeight),
        ])
        socialMesiaStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            socialMesiaStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                          constant: constants.standartSidePadding),
            socialMesiaStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                           constant: -constants.standartSidePadding),
            socialMesiaStackView.topAnchor.constraint(equalTo: self.orRegisterText.bottomAnchor,
                                             constant: constants.topStandartConstraint),
            socialMesiaStackView.heightAnchor.constraint(equalToConstant: constants.standartHeight)
            ])
        orRegisterText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orRegisterText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            orRegisterText.topAnchor.constraint(equalTo: self.verticalStackView.bottomAnchor,
                                                constant: constants.topStandartConstraint)
            ])
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftLine.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                              constant: constants.standartSidePadding),
            leftLine.trailingAnchor.constraint(equalTo: self.orRegisterText.leadingAnchor,
                                               constant: -constants.smallIndent),
            leftLine.topAnchor.constraint(equalTo: self.verticalStackView.bottomAnchor,
                                             constant: constants.topStandartConstraint),
            leftLine.heightAnchor.constraint(equalToConstant: constants.lineHeight)
        ])
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightLine.leadingAnchor.constraint(equalTo: self.orRegisterText.trailingAnchor,
                                              constant: constants.smallIndent),
            rightLine.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                               constant: -constants.standartSidePadding),
            rightLine.topAnchor.constraint(equalTo: self.verticalStackView.bottomAnchor,
                                             constant: constants.topStandartConstraint),
            rightLine.heightAnchor.constraint(equalToConstant: constants.lineHeight)
            ])
        orLogInWithText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orLogInWithText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            orLogInWithText.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
