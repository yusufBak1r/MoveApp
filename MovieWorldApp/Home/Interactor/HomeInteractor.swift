//
//  HomeInteractor.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 31.03.2024.
//

import Foundation
import Alamofire
protocol HomeInteractorProtocol {
    
    var ınteractorTopresenter : HomePresenterProtocol? {get set}
    var networking: NetworkManagerProtocol? {get}
    func getCategory(type : MovieCategory,page :Int,complete:@escaping((Movie?,Error?))->())
   
}
class HomeInteractor: HomeInteractorProtocol {
    func getCategory(type: MovieCategory, page: Int, complete: @escaping ((Movie?, Error?)) -> ()) {
        var url = ""
        switch type {
        case .popular:
        url =  HomeEndpoint.popular.path
        case .nowPlaying:
            url = HomeEndpoint.nowPlaying.path
        case .trending:
            url = HomeEndpoint.trending.path
        case .topRated:
            url = HomeEndpoint.topRated.path
        case .upcoming:
            url = HomeEndpoint.upcoming.path
        }
        
       networking?.makeRequest(type: Movie?.self, url: url, method: .get, completion: { response in
          
            switch response {
            case .success(let data):
                complete((data,nil))
            case .failure(let failure):
                complete((nil,failure))
            }
            
            
            
        })
    }
    
     var networking: NetworkManagerProtocol?
     var ınteractorTopresenter: HomePresenterProtocol?
     let networkManager = NetworkManager()
          
    init(networking: NetworkManagerProtocol? = nil, ınteractorTopresenter: HomePresenterProtocol? = nil) {
        self.networking = networkManager
        self.ınteractorTopresenter = ınteractorTopresenter
        
        
        
    }
    
    
    
    
    
    
    
  
    }


        
