//
//  MainViewController.swift
//  tableview_MVVM
//
//  Created by Samir Raut on 22/12/23.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MarvelSeries]> = Observable(nil)
    var filteredcellDataSource: [MarvelSeries] = []
    var dataSource: MarvelResponse?

    func numberOfSections()-> Int {
       return 1
    }

    func numberOfRows(in section: Int)-> Int {
        return filteredcellDataSource.count // self.dataSource?.data.count ?? 2
    }
    
    func  getdata() {
        
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        
        APICaller.getTrendingMovies { [weak self] result in
            
            self?.isLoading.value = false
            
            switch result {
            case .success(let response):
                print("Trending Movie : ", response.status)
                self?.dataSource = response
                self?.mapCellData()
            case .failure(let error):
                print("Error: ", error)
            }
        }
    }
    
    func mapCellData() {
        
        self.cellDataSource.value = self.dataSource?.data.results ?? []
        self.filteredcellDataSource = self.dataSource?.data.results ?? []
    }
    
    func getmovieTitle(_ movie: MarvelSeries) -> String {
        return movie.title 
    }
    
    func filterContentForSearchText(_ searchText: String) -> [MarvelSeries] {
        
      
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            filteredcellDataSource = cellDataSource.value!
            return filteredcellDataSource
        }
        
        
        filteredcellDataSource = self.cellDataSource.value!.filter {
                $0.title.lowercased().contains(searchText.lowercased())
            }
        return filteredcellDataSource
        }
    
    func retriveMovie(with movieId: Int) -> MarvelSeries? {
        guard let movie = self.dataSource?.data.results.first(where: {$0.id == movieId}) else {return nil}
        
        return movie
    }
    
}
