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
    func downloadFileFromURL(url: URL, _ completion: @escaping ((URL)?) -> Void)
}

struct MeditationDetailViewModel: MeditationDetailDelegate {
    var detailArr: Box<CollectionDetailModel> = Box(CollectionDetailModel())
    
    func fetchMeditationDetail(meditationName: String) {
        let fsDb = FSDatabase()
        fsDb.fetchCollectionDetail(docName: meditationName, completion: { (response) in
            DispatchQueue.main.async {
                UIViewController.top?.view.sainiRemoveLoader()
            }
            if let success = response , !success.isEmpty {
                self.detailArr.value = success[0]
            }
            else {
                log.info("ERROR")/
            }
        })
    }
    
    func downloadFileFromURL(url: URL, _ completion: @escaping ((URL)?) -> Void){
        DispatchQueue.main.async {
            UIViewController.top?.view.sainiShowLoader(loaderColor: UIColor.darkGray)
        }
        var downloadTask:URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: { (URL, response, error) -> Void in
            guard let linkUrl = URL else { return}
            completion(linkUrl)
        })
        downloadTask.resume()
    }
}
