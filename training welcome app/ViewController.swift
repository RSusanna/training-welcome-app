

import UIKit

final class ViewController: UIViewController {
    
    private var anotherView = SomeViews()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = anotherView
    }
}

