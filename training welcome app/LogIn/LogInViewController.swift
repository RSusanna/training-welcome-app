import UIKit

final class logInViewController: BaseViewController {
    
    private var anotherView = LogInView()
    
    override func loadView() {
        self.view = anotherView
        anotherView.delegate = self

    }    
}

// подписываем под протокол покажи мне новую вью
extension logInViewController: ShowNewViewProtocol {
    func showNewView(VC: UIViewController) {
        let VC = VC
        // соответственно открываем новую вью
        navigationController?.pushViewController(VC, animated: true)
    }
}
/*
 extension StartViewController: ShowNewViewProtocol {
     func showNewView(VC: UIViewController) {
         let VC = VC
         // соответственно открываем новую вью
         navigationController?.pushViewController(VC, animated: true)
     }
 }

 */

