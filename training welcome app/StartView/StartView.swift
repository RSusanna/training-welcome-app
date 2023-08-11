import UIKit

//создаем протокол покажи мне новую вью
protocol ShowNewViewProtocol: AnyObject {
    func showNewView( VC: UIViewController)
}

extension StartView {
    struct Constants {
        let darkColor = AppColor.darkColor.color
        let lightBlueColor = AppColor.lightBlue.color
        
        let backgroundImage: UIImage? = UIImage(named: "backgroundImage")
        let logoImage: UIImage? = UIImage(named: "Branding")
        
        let buttonSidePadding: CGFloat = 22.0
        let registerButtonBottomPadding: CGFloat = -46.0
        let buttonHeight: CGFloat = 56.0
        let loginButtonBottomPadding: CGFloat = -15.0
        let logoImageBottomPadding: CGFloat = 44.0
        let logoImageSidePadding: CGFloat = 117.0
        let logoImageMultipyedHeight: CGFloat = 0.7
    }
}

final class StartView: BaseView {
    
    weak var delegate: ShowNewViewProtocol?
    
    private let constants: Constants
    
    private lazy var backgroundImageView: UIImageView = {
        return UIImageView(image: constants.backgroundImage)
    }()
    
    private lazy var logoImageView: UIImageView = {
        return UIImageView(image: constants.logoImage)
    }()
    
    private lazy var loginButton: UIButton = {
        let button = createMainButton(
            title: "Login", titleColor: .white, font: .semibold15,
            backgroundColor: .darkColor
        )
        button.addTarget(self, action: #selector(actionButtonLogIn), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = createMainButton(
            title: "Register", titleColor: .black, font: .semibold15,
            backgroundColor: .white
        )
        button.layer.borderWidth = 1
        button.layer.borderColor = constants.darkColor.cgColor
        return button
    }()
    
    private lazy var guestButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue as a guest", for: .normal)
        button.titleLabel?.font =  .semibold15
        button.setTitleColor(constants.lightBlueColor, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        self.constants = Constants()
        super.init(frame: frame)
        addSubviews()
        setupViewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension StartView {
    @objc func actionButtonLogIn(){
        delegate?.showNewView(VC: logInViewController())
    }
    
    func addSubviews() {
        [backgroundImageView, loginButton,
         registerButton, guestButton, logoImageView
        ].forEach({ self.addSubview($0) })
    }
    
    func setupViewsConstraints() {
        //констрейнты фоновой картинки
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        guestButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            guestButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            guestButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constants.buttonSidePadding),
            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -constants.buttonSidePadding),
            registerButton.heightAnchor.constraint(equalToConstant: constants.buttonHeight),
            registerButton.bottomAnchor.constraint(equalTo: guestButton.topAnchor, constant: constants.registerButtonBottomPadding)
        ])

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constants.buttonSidePadding),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -constants.buttonSidePadding),
            loginButton.heightAnchor.constraint(equalToConstant: constants.buttonHeight),
            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: constants.loginButtonBottomPadding)
        ])
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -constants.logoImageBottomPadding),
            logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constants.logoImageSidePadding),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -constants.logoImageSidePadding),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: constants.logoImageMultipyedHeight)
        ])
    }
}
