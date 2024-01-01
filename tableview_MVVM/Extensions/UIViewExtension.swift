
import Foundation
import UIKit

extension UIView {
    
    func round() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func addBoeder() {
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "#EBEBEB")?.cgColor
    }
    
}
