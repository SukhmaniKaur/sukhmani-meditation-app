//
//  HomeListingViewModel.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 26/11/21.
//

import Foundation
import SainiUtils

protocol HomeListingDelegate {
    var collectionArr: Box<[CollectionModel]> { get set }
    func fetchHomeListing()
}

struct HomeListingViewModel: HomeListingDelegate {
    var collectionArr: Box<[CollectionModel]> = Box([CollectionModel]())
    
    func fetchHomeListing() {
        let fsDb = FSDatabase()
        fsDb.fetchCollection { (response) in
            if let success = response , !success.isEmpty {
                self.collectionArr.value = success
            }
            else {
                log.info("ERROR")/
            }
        }
    }
}
