//
//  DetailsMovieViewModel.swift
//  tableview_MVVM
//
//  Created by Samir Raut on 28/12/23.
//

import Foundation

class DetailsMovieViewModel {
    
    var movie: MarvelSeries
    
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    
    init(movie: MarvelSeries) {
        self.movie = movie
        
        self.movieTitle = movie.title
        self.movieDescription = movie.description ?? "No Data Found"
        self.movieImage = makeImageURL(photoPath: movie.thumbnail.path, photoExt: movie.thumbnail.extension)
    }
    
    private func makeImageURL(photoPath: String, photoExt: String) -> URL? {
       return URL(string: "\(photoPath).\(photoExt)")
    }
    
}
