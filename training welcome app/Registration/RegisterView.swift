// я остановилась на том, что мне нужно текстфилды внести в стеквью и доделать эту страницу в целом
import UIKit

extension RegisterView {
    struct Constants {
    let radiusOfViews = 8
    }
}

final class RegisterView: BaseView {
    
    weak var delegate: ShowNewViewProtocol?
    
    //MARK: - UILAbel
    private lazy var mainText: UILabel = {
       let text = createMainUILabel(text: "Hello! Register to get started")
        return text
    }()
    private let orLogInWithText: UILabel = {
        var textInformation =  UILabel()
        textInformation.text = "Or Register with"
        textInformation.font = UIFont(name: "HelveticaNeue", size: 14)
        textInformation.textColor = .black
        return textInformation
    }()
    //MARK: - вьюшки
    private lazy var leftLine: UIView = {
        let view = createLeftLineView()
        view.frame = CGRect(x: 22, y: 625, width: 112, height: 1)
        return view
    }()
    private lazy var rightLine: UIView = {
        let view = createRightLineView()
        view.frame = CGRect(x: 250, y: 625, width: 112, height: 1)
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
    //MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
        setupViewsConstraints()
    }
    
    //MARK: - Добавление
    private func addViews(){
        self.addSubview(mainText)
        self.addSubview(orLogInWithText)
        self.addSubview(leftLine)
        self.addSubview(rightLine)
        self.addSubview(verticalStackView)
        self.addSubview(socialMesiaStackView)
        self.addSubview(leftLine)
        self.addSubview(rightLine)
        self.addSubview(orRegisterText)
    }
    //MARK: - констрейнты
    func setupViewsConstraints() {
        mainText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            mainText.topAnchor.constraint(equalTo: self.topAnchor, constant: 125),
            mainText.widthAnchor.constraint(equalToConstant: 280),
            mainText.heightAnchor.constraint(equalToConstant: 78)
        ])
        NSLayoutConstraint.activate([
            orLogInWithText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 146),
            orLogInWithText.topAnchor.constraint(equalTo: self.topAnchor, constant: 515),
            orLogInWithText.widthAnchor.constraint(equalToConstant: 84),
            orLogInWithText.heightAnchor.constraint(equalToConstant: 17)
            ])
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22),
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 235),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -231)
        ])
        socialMesiaStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            socialMesiaStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            socialMesiaStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22),
            socialMesiaStackView.heightAnchor.constraint(equalToConstant: 56),
            socialMesiaStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -105)
            ])
        orRegisterText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orRegisterText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140),
            orRegisterText.topAnchor.constraint(equalTo: self.topAnchor, constant: 620),
//            orRegisterText.widthAnchor.constraint(equalToConstant: 101),
            ])
    }
}

//
//
