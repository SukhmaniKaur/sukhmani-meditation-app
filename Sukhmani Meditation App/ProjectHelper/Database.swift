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

    func fetchCollection(completion: @escaping (_ dictArr: [CollectionModel]?) -> Void) {
        Firestore.firestore().collection("meditation").getDocuments() { (querySnapshot, err) in
            guard err == nil else { return }
            guard let collectionArr: [CollectionModel] = try? querySnapshot?.toObject() else { return }
            completion(collectionArr)
        }
    }
}
