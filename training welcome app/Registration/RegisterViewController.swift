import UIKit
// создали класс и подписали его под протокол покажи новый вью
final class RegisterViewController: BaseViewController, ShowNewViewProtocol {
    func showNewView(VC: UIViewController) {
        let VC = VC
        // соответственно открываем новую вью
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
    
    // создаем тут SomeViews
    private var anotherView = RegisterView()
    
    override func loadView() {
        self.view = anotherView
        // подписываем ее как делегат
        anotherView.delegate = self
    }

}
