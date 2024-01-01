
import UIKit

class MainMovieTableViewCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            return "tableCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainMovieTableViewCellStoryboard", bundle: nil)
    }
    
    @IBOutlet var lbl_MovieName: UILabel!
    @IBOutlet var lbl_MovieRating: UILabel!
    @IBOutlet var lbl_MovieYear: UILabel!
    @IBOutlet var iv_MovieImg: UIImageView!
    @IBOutlet var vw_MovieBg: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        vw_MovieBg.addBoeder()
        vw_MovieBg.round()
        
        iv_MovieImg.round()
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) { // MovieTableCellViewModel
        self.lbl_MovieName.text = viewModel.title
        self.lbl_MovieRating.text = viewModel.rating
        self.lbl_MovieYear.text = String(viewModel.date)
        
        self.iv_MovieImg.loadImage(from: viewModel.imageUrl!)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
