//
//  ElementAPIManager.swift
//  Elements
//
//  Created by Bianca Brown on 10/1/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

class ElementAPIManager {
    private init() {}
    
    static let shared = ElementAPIManager()
    // this is a singleton pattern of the ElementAPIManager
    
    
    func getElements(completionHandler: @escaping (Result<[Elements],AppError>) -> ()) {
        
        let urlString = " http://api.tvmaze.com/search/shows?q=girls"
        
        guard let url = URL(string: urlString) else {completionHandler(.failure(.badURL));
            return
            
        }
        
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) {(result) in
          switch result {
          case .failure(let error):
            completionHandler(.failure(error))
          case .success(let data):
            do {
              let elementInfo = try JSONDecoder().decode([Elements].self, from: data)
              completionHandler(.success(elementInfo))
            } catch {
              completionHandler(.failure(.couldNotParseJSON(rawError: error)))
            }
          }
        }
      }
    
    
    
    func postFavouriteElement(favorite: FavoriteElements, completionHandler: @escaping (Result<Data,AppError>) -> ()) {
        
        let urlString = "https://5d83bc5ebaffda001476aa88.mockapi.io/api/v1/favorites"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL));
            return
            
        }
        
        guard let encodedData = try? JSONEncoder().encode(favorite) else {
            completionHandler(.failure(.noDataReceived))
            
            return
        
        }
        
        NetworkHelper.manager.performDataTask(withUrl: url, andHTTPBody: encodedData, andMethod: .post) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(.other(rawError: error)))
            case .success(let success):
                completionHandler(.success(success))
            }
        }
        
            
//            .performDataTask(withUrl: urlString, andHTTPBody: encodedData, andMethod: .post) { (result) in
//            switch result {
//            case .failure(let error):
//                completionHandler(.failure())
//            }

        }
        }

