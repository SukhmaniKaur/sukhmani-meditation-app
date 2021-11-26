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
    var docIdArray: Box<[String]> { get set }
    func fetchHomeListing()
}

struct HomeListingViewModel: HomeListingDelegate {
    var docIdArray: Box<[String]> = Box([String]())
    var collectionArr: Box<[CollectionModel]> = Box([CollectionModel]())
    
    func fetchHomeListing() {
        let fsDb = FSDatabase()
        fsDb.fetchCollection { (response,docIdArr)  in
            if let success = response , !success.isEmpty {
                self.docIdArray.value = docIdArr
                self.collectionArr.value = success
            }
            else {
                log.info("ERROR")/
            }
        }
    }
}
