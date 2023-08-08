import UIKit
//создаем протокол покажи мне новую вью
protocol showNewViewProtocol {
    func showNewView( VC: UIViewController)
}


final class ViewController: UIViewController {
    
    // создаем тут SomeViews
    private var anotherView = SomeViews()
    override func loadView() {
        self.view = anotherView
        // подписываем ее как делегат
        anotherView.delegate = self
    }
}

// подписываем под протокол покажи мне новую вью
extension ViewController: showNewViewProtocol {
    func showNewView(VC: UIViewController) {
        let VC = VC
        // соответственно открываем новую вью
        navigationController?.pushViewController(VC, animated: true)
//        present(VC, animated: true)
    }
}
