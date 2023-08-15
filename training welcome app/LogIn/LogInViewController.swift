import UIKit

final class logInViewController: BaseViewController {
    
    private var anotherView = LogInView()
    
    private lazy var router: AppRouterProtocol = {
        let router = AppRouter()
        router.view = self
        return router
    }()
    
    override func loadView() {
        anotherView.delegate = self
        self.view = anotherView
    }
}

extension logInViewController: LogInViewDelegate {
    func didTapRegister() {
        router.routeToRegister()
    }
}


