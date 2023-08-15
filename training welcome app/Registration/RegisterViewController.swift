import UIKit
// создали класс и подписали его под протокол покажи новый вью
final class RegisterViewController: BaseViewController {

    private var anotherView = RegisterView()
    
    override func loadView() {
        self.view = anotherView
    }
}

