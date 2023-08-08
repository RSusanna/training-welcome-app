import UIKit

final class logInView: UIViewController {
    

    private var anotherView = ViewsForLogInPage()
    override func loadView() {
        self.view = anotherView
        view.backgroundColor = .white
    }    
}

