import UIKit

final class StartViewController: BaseViewController {
    
    // создаем тут SomeViews
    private var anotherView = StartView()
    override func loadView() {
        self.view = anotherView
        // подписываем ее как делегат
        anotherView.delegate = self
    }
}

// подписываем под протокол покажи мне новую вью
extension StartViewController: ShowNewViewProtocol {
    func showNewView(VC: UIViewController) {
        let VC = VC
        // соответственно открываем новую вью
        navigationController?.pushViewController(VC, animated: true)
    }
}
