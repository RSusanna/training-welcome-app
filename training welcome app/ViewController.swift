

import UIKit

final class ViewController: UIViewController {
    
    private var anotherView = SomeViews()
    
    
    override func loadView() {
        self.view = anotherView
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
}

