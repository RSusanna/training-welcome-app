
import UIKit

final class ViewsForfirstPage: UIView {
    
    var delegate: showNewViewProtocol!
   
    private let blueColor: UIColor = {
        let color = UIColor(red: 0.208, green: 0.762, blue: 0.757, alpha: 1)
        return color
    }()
    private let darkBlueColor: UIColor = {
      let color = UIColor(red: 30/255, green: 35/255, blue: 44/255, alpha: 1)
        return color
    }()
    private let firstView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let logoView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        guestButton.setTitleColor(blueColor, for: .normal)
        logInButton.backgroundColor = darkBlueColor
    }
    
    private let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Urbanist-SemiBold", size: 15)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(actionButtonLogIn), for: .touchUpInside)
        return button
    }()
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "Urbanist-SemiBold", size: 15)
        button.layer.backgroundColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = .init(red: 0.0, green: 0.0, blue: 0.5, alpha: 1.0)
        button.layer.borderWidth = 1
        return button
    }()
    private let guestButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue as a guest", for: .normal)
        button.titleLabel?.font =  UIFont(name: "Urbanist-Bold", size: 15)
        return button
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addFirstView()
        addLogoPhoto()
        addButton()
        setupViewsConstraints()
    }
    
    private func addFirstView() {
        self.addSubview(firstView)
        if let backgroundImage = UIImage(named: "backgroundImage") {
            firstView.backgroundColor = UIColor(patternImage: backgroundImage)
        }
    }
    // метод для добавления фото
    private func addLogoPhoto(){
        self.addSubview(logoView)
        if let brandingImage = UIImage(named: "branding") {
            logoView.backgroundColor = UIColor(patternImage: brandingImage)
        }
    }
    // метод для добавления кнопки
    private func addButton(){
        self.addSubview(logInButton)
        self.addSubview(registerButton)
        self.addSubview(guestButton)
    }
    
    private func setupViewsConstraints() {
        //констрейнты фоновой картинки
        firstView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: self.topAnchor),
            firstView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            firstView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        //констрейнты лого картинки
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.frame = CGRect(x: 117, y: 448, width: 141.13, height: 99.03)
        
        //констрейнты кнопки logIn
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            logInButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 591),
            logInButton.widthAnchor.constraint(equalToConstant: 331),
            logInButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        //констрейнты кнопки register
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            registerButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 662),
            registerButton.widthAnchor.constraint(equalToConstant: 331),
            registerButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        //констрейнты кнопки guestButton
        guestButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            guestButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 121),
            guestButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 769),
            guestButton.widthAnchor.constraint(equalToConstant: 133),
            guestButton.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    @objc func actionButtonLogIn(){
       delegate.showNewView(VC: logInView())
    }
    
    
    func testProtocol(delegate: showNewViewProtocol){
        self.delegate = delegate
    }
}

/*
 исправить все чтобы можно было переиспользовать, сделать  код более гибким
 может когда вызывать кнопку просто чтоб фон мменялся а не соза
 погуглить что за комбайны
 */
