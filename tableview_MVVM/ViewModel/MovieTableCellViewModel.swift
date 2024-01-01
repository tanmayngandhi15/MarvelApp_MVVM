
import Foundation

class MovieTableCellViewModel {
    
    var id: Int
    var title: String
    var date: Int
    var rating: String
    var imageUrl: URL?
    
    init(movie: MarvelSeries) {
        self.id = movie.id
        self.title = movie.title 
        self.rating = movie.rating 
        self.date = movie.startYear 
        self.imageUrl = makeImageURL(photoPath: movie.thumbnail.path,photoExt: movie.thumbnail.extension)
    }
    
    
    private func makeImageURL(photoPath: String, photoExt: String) -> URL? {
       return URL(string: "\(photoPath).\(photoExt)")
    }
    
}
