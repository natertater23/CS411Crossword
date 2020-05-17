

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet var tButton: UIButton!
    @IBOutlet var cButton: UIButton!
    @IBOutlet var oButton: UIButton!
    @IBOutlet var s2Button: UIButton!
    
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var eButton: UIButton!
    @IBOutlet var hButton: UIButton!
    @IBOutlet var rButton: UIButton!
    @IBOutlet var s1Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
        eButton.center.x = self.view.frame.width + 100
        hButton.center.x = self.view.frame.width + 100
        rButton.center.y = self.view.frame.height + 100
        s1Button.center.y = self.view.frame.height + 100
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 20, options: [], animations: {
            self.eButton.center.x = self.view.frame.width / 2
            self.hButton.center.x = self.view.frame.width / 2
            self.rButton.center.y = self.view.frame.height / 2
            self.s1Button.center.y = self.view.frame.height / 2
        }, completion: nil)
        

        startButton.flash()
    }
}
