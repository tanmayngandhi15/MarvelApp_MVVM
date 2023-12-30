//
//  MainViewController.swift
//  tableview_MVVM
//
//  Created by Samir Raut on 22/12/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var tv_dataDisplay: UITableView!
    @IBOutlet var ai_activityIndicator: UIActivityIndicatorView!
    @IBOutlet var sb_searchMovie: UISearchBar!
    
    var viewModel: MainViewModel = MainViewModel()
    
    var cellDataSource: [MarvelSeries] = []
    var filteredcellDataSource: [MarvelSeries] = []
    
    override func viewDidLoad() {
        
      //  configTableView()

        // Call the function to initiate the network request and decoding
        bindViewModel()
        
    }
    
    func configTableView() {
       // self.title = "Top marvel Movies"
        setupTableView()
        setupSearchBar()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isloading in
            guard let self = self, let isLoading = isloading else {
                return
            }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.ai_activityIndicator.startAnimating()
                } else {
                    self.ai_activityIndicator.stopAnimating()
                }
            }
            
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.filteredcellDataSource = movies
            print(#function)
            configTableView()
            self.reloadTableView()
        }
    }

    func openDetails(movieId: Int) {
        guard let movie = viewModel.retriveMovie(with: movieId) else {
            return
        }
        
        DispatchQueue.main.async {
         
            print("Movie: ",movie.title)
   
             let detailsViewModel = DetailsMovieViewModel(movie: movie)
            print("Model: ",detailsViewModel)
             let detailsController = DetailsMovies(viewModel: detailsViewModel)
            print("Controller: ",detailsController)
             self.navigationController?.pushViewController(detailsController, animated: true)
             
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getdata()
    }

    
}
