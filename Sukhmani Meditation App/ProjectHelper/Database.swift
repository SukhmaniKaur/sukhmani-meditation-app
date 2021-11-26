//
//  Database.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 26/11/21.
//

import Foundation
import Firebase
import FirebaseAuth

class FSDatabase: NSObject {

    func fetchCollection(completion: @escaping (_ dictArr: [CollectionModel]?, _ docId: [String]) -> Void) {
        DispatchQueue.main.async {
            UIViewController.top?.view.sainiShowLoader(loaderColor: UIColor.darkGray)
        }
        Firestore.firestore().collection("meditation").getDocuments() { (querySnapshot, err) in
            guard err == nil else { return }
            guard let collectionArr: [CollectionModel] = try? querySnapshot?.toObject() else { return }
            guard let docArr: [String] = querySnapshot?.getDocID() else { return }
            completion(collectionArr, docArr)
        }
    }
    
    func fetchCollectionDetail(docName: String, completion: @escaping (_ dictArr: [CollectionDetailModel]?) -> Void) {
        DispatchQueue.main.async {
            UIViewController.top?.view.sainiShowLoader(loaderColor: UIColor.darkGray)
        }
        let docRef = Firestore.firestore().collection("meditation").document(docName).collection("session")
        docRef.getDocuments { (querySnapshot, err) in
            guard err == nil else { return }
            guard let collectionDetailArr: [CollectionDetailModel] = try? querySnapshot?.toObject() else { return }
            completion(collectionDetailArr)
        }
    }
}
