import UIKit

final class AppRouter: AppRouterProtocol {
    
    weak var view: UIViewController?
    
    func routeToLogin() {
        let loginView = logInViewController()
        self.view?.navigationController?.pushViewController(loginView, animated: true)
    }
    
    func routeToRegister() {
        let registerView = RegisterViewController()
        self.view?.navigationController?.pushViewController(registerView, animated: true)
    }
}
