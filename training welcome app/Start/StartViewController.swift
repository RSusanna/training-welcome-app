import UIKit

final class StartViewController: BaseViewController {
    
    private lazy var router: AppRouterProtocol = {
        let router = AppRouter()
        router.view = self
        return router
    }()
    
    private let startView = StartView()
    override func loadView() {
        startView.delegate = self
        self.view = startView
    }
}

extension StartViewController: StartViewDelegate {
    func didTapLogin() {
        router.routeToLogin()
    }
    
    func didTapRegister() {
        router.routeToRegister()
    }
}
