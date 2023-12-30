//
//  APICaller.swift
//  tableview_MVVM
//
//  Created by Samir Raut on 22/12/23.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

class APICaller {

    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<MarvelResponse,NetworkError>)-> Void) {
        
       // let urlString = NetworkConstant.shared.serverAddress
        let urlString = NetworkConstant.shared.getSeriesURL(limit: 20, offset: 0)
        
        guard let url = URL(string: urlString) else {
        
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, response, error in
            
            if error == nil, let data = dataResponse, let resultData = try? JSONDecoder().decode(MarvelResponse.self, from: data) {
                
                completionHandler(.success(resultData))
                
            } else {
                completionHandler(.failure(.canNotParseData))
            }
            
        }.resume()

    }

}


// Not using Closures
/*
 func MarvelAPICall() {
 
 let urlSring = NetworkConstant.shared.serverAddress
 var strResponse = ""
 
 guard let url = URL(string: urlSring) else {
 return
 }
 
 let task = URLSession.shared.dataTask(with: url) {
 (data,response,error) in
 guard let data = data, error == nil else {
 return
 }
 
 do {
 let decoder = JSONDecoder()
 let responseModel = try decoder.decode(MarvelResponse.self, from: data)
 
 strResponse = responseModel.status
 print("Response: ", responseModel.status, strResponse)
 
 } catch let decodingError {
 print("Error: ", decodingError)
 }
 
 }
 task.resume()
 }
 */
