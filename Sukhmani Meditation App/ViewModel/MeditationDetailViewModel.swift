//
//  MeditationDetailViewModel.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 27/11/21.
//

import Foundation
import SainiUtils

protocol MeditationDetailDelegate {
    var detailArr: Box<CollectionDetailModel> { get set }
    func fetchMeditationDetail(meditationName: String)
}

struct MeditationDetailViewModel: MeditationDetailDelegate {
    var detailArr: Box<CollectionDetailModel> = Box(CollectionDetailModel())
    
    func fetchMeditationDetail(meditationName: String) {
        let fsDb = FSDatabase()
        fsDb.fetchCollectionDetail(docName: meditationName, completion: { (response) in
            if let success = response , !success.isEmpty {
                self.detailArr.value = success[0]
            }
            else {
                log.info("ERROR")/
            }
        })
    }
}
