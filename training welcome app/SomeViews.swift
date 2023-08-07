
import UIKit

final class SomeViews: UIView {
    
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
        self.backgroundColor = .brown
    }
    
    private let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        let backgroundColor = UIColor(red: 30/255, green: 35/255, blue: 44/255, alpha: 1.0)
        button.backgroundColor = backgroundColor
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("register", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.backgroundColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = .init(red: 0.0, green: 0.0, blue: 0.5, alpha: 1.0)
        button.layer.borderWidth = 5
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
    }
}
