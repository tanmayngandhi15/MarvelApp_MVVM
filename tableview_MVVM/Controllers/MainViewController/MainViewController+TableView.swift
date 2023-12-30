//
//  MainViewController+TableView.swift
//  tableview_MVVM
//
//  Created by Samir Raut on 22/12/23.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func setupSearchBar() {

        self.sb_searchMovie.delegate = self
        self.sb_searchMovie.text = ""
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredcellDataSource = viewModel.filterContentForSearchText(searchText)
            reloadTableView()
        }
    
    
    func setupTableView() {
        
        self.tv_dataDisplay.delegate = self
        self.tv_dataDisplay.dataSource = self
        
        self.tv_dataDisplay.backgroundColor = .clear
        
        
        registerCells()
    }
    
    func registerCells() {
      //  self.tv_dataDisplay.register(UINib(nibName: "MainMovieTableViewCellStoryboard", bundle: nil), forCellReuseIdentifier: "tableCell")
        
        self.tv_dataDisplay.register(MainMovieTableViewCell.register(), forCellReuseIdentifier: MainMovieTableViewCell.identifier)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func reloadTableView() {
        print(#function)
        DispatchQueue.main.async {
            self.tv_dataDisplay.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? MainMovieTableViewCell else {
            return UITableViewCell()
        }

            let marvelSeries = filteredcellDataSource[indexPath.row]

            let cellViewModel = MovieTableCellViewModel(movie: marvelSeries)

            cell.setupCell(viewModel: cellViewModel)

     //   cell.lbl_MovieName?.text = self.viewModel.getmovieTitle(marvelSeries)

        
   /*Cannot convert value of type 'MarvelSeries' to expected argument type 'MovieTableCellViewModel'
        let photoPath = self.cellDataSource[indexPath.row].thumbnail.path
        let photoExt = self.cellDataSource[indexPath.row].thumbnail.extension
        if let Imageurl = URL(string:"\(photoPath).\(photoExt)") {
          
            let task1 = URLSession.shared.dataTask(with: Imageurl) { (data, response, error) in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    cell.iv_MovieImg.image = UIImage(data: data)
                } }
            task1.resume()
        }
        
        cell.lbl_MovieName.text = "Name: " + self.cellDataSource[indexPath.row].title
        cell.lbl_MovieRating.text = "Rate: " + self.cellDataSource[indexPath.row].rating
        cell.lbl_MovieYear.text = "Year: " + String(self.cellDataSource[indexPath.row].startYear)
    */

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = filteredcellDataSource[indexPath.row].id
        self.openDetails(movieId: movieId)
    }

}
