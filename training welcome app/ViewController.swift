

import UIKit

final class ViewController: UIViewController {
    
    private var anotherView = SomeViews()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = anotherView
    }
}
/*
 override func loadView() {
 super.loadView()
 self.view = anotherView
 
 
 }
 
 
 override func viewDidLoad() {
 super.viewDidLoad()
 anotherView.delegate = self
 view.backgroundColor = .blue
 
 }
 }
 
 extension ViewController: SomeViews {
 func didTapButton() {
 
 }
 }
 */

