
import UIKit

final class ViewsForLogInPage: UIView {
    //MARK: - цвета экрана
    private let grayColor: UIColor = {
        let color = UIColor(red: 0.91, green: 0.925, blue: 0.957, alpha: 1)
        return color
    }()
    private let darkBlueColor: UIColor = {
        let color = UIColor(red: 0.118, green: 0.137, blue: 0.173, alpha: 1)
        return color
    }()

    //MARK: - текста экрана
    private let welcomeText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Welcome back! Glad to see you, Again!"
        return label
    }()

    private let orLogInWithText: UILabel = {
        var textInformation =  UILabel()
        textInformation.text = "Or Login with"
        textInformation.font = UIFont(name: "HelveticaNeue", size: 14)
        textInformation.textColor = .black
//        textInformation.textColor = UIColor(red: 0.416, green: 0.439, blue: 0.486, alpha: 1)
        return textInformation
    }()
    private let dontHaveAccText: UILabel = {
        var textInformation =  UILabel()
        textInformation.text = "Don’t have an account?"
        textInformation.font = UIFont(name: "Urbanist-Medium", size: 15)
        textInformation.textColor = UIColor(red: 0.118, green: 0.137, blue: 0.173, alpha: 1)
        return textInformation
    }()
    //MARK: - Текстфилды экрана

    let emailTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter your email"
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.91, green: 0.925, blue: 0.957, alpha: 1).cgColor
       return view
    }()
    let passwordTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter your password"
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.91, green: 0.925, blue: 0.957, alpha: 1).cgColor
       return view
    }()


    
    //MARK: - init'ы
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        welcomeText.textColor = darkBlueColor
        emailTextField.backgroundColor = grayColor
        passwordTextField.backgroundColor = grayColor
    }
    
    
    //MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
        setupViewsConstraints()
        // сюда прописать добавление всех деталей экрана
    }
    
    //MARK: - Добавление
    private func addViews(){
        self.addSubview(welcomeText)
        self.addSubview(orLogInWithText)
        self.addSubview(dontHaveAccText)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)

    }
    //MARK: - настройка констрейнтов
    private func setupViewsConstraints() {
        //констрейнты welcomeText
        welcomeText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            welcomeText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            welcomeText.topAnchor.constraint(equalTo: self.topAnchor, constant: 125),
            welcomeText.widthAnchor.constraint(equalToConstant: 280),
            welcomeText.heightAnchor.constraint(equalToConstant: 78)
        ])
        //констрейнты orLogInWithText
        orLogInWithText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orLogInWithText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 146),
            orLogInWithText.topAnchor.constraint(equalTo: self.topAnchor, constant: 515),
            orLogInWithText.widthAnchor.constraint(equalToConstant: 84),
            orLogInWithText.heightAnchor.constraint(equalToConstant: 17)
            ])
        //констрейнты dontHaveAccText
        dontHaveAccText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dontHaveAccText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 61),
            dontHaveAccText.topAnchor.constraint(equalTo: self.topAnchor, constant: 765),
//          dontHaveAccText.widthAnchor.constraint(equalToConstant:---)
            dontHaveAccText.heightAnchor.constraint(equalToConstant: 21)
        ])
        //констрейнты emailTextField
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            emailTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 235),
            emailTextField.widthAnchor.constraint(equalToConstant: 331),
            emailTextField.heightAnchor.constraint(equalToConstant: 51)
        ])
        //констрейнты passwordTextField
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            passwordTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 306),
            passwordTextField.widthAnchor.constraint(equalToConstant: 331),
            passwordTextField.heightAnchor.constraint(equalToConstant: 51)
            ])
    }
}
 


