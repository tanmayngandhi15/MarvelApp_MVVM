
import UIKit

class GIFViewController: UIViewController {

    @IBOutlet var gifImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
         let gifImage = UIImage.gif(asset: "marvelGIF")
         gifImageView.image = gifImage


        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            
            let storyboard = UIStoryboard(name: "MainViewControllerStoryboard", bundle: Bundle.main)
                         let vc3 = storyboard.instantiateViewController(withIdentifier: "mainView") as! MainViewController
                    //    self.navigationController?.pushViewController(vc3, animated: true)
            
            self.navigationController?.setViewControllers([vc3], animated: true)
            
        /*
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "MainViewControllerStoryboard", bundle: Bundle.main)
            let mainViewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "mainView")
            self.present(mainViewController, animated: true, completion: nil)
     */
   
        }
  
    }

}
