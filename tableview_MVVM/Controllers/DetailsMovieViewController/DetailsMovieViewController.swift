
import UIKit

class DetailsMovies: UIViewController {
    
    @IBOutlet var iv_movieImg: UIImageView!
    @IBOutlet var lbl_movieTitle: UILabel!
    @IBOutlet var lbl_movieDesc: UILabel!
    
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieStoryboard", bundle: Bundle.main)
      //  super.init(nibName: nil, bundle: nil)
    } // MovieDetailId // DetailsMovieViewControllerStoryboard
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configView()
    }

    func configView() {
        print("Title: ", viewModel.movieTitle)
        self.title = "Movie Details"
        lbl_movieTitle.text = viewModel.movieTitle
        lbl_movieDesc.text = viewModel.movieDescription
        iv_movieImg.loadImage(from: viewModel.movieImage!)
    }

}
