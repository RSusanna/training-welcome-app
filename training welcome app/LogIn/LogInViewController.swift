import UIKit

final class logInViewController: BaseViewController {
    

    private var anotherView = LogInView()
    override func loadView() {
        self.view = anotherView
    }    
}

