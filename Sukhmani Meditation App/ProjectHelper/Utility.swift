//
//  Utility.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 26/11/21.
//

import Foundation
import Firebase
import SainiUtils

public func Decode<T:Decodable>(jsonData:Data,resultType: T.Type) -> T?{
    let decoder = JSONDecoder()
    do {
        let result = try decoder.decode(T.self, from: jsonData)
        return result
    }
    catch let error{
        log.error("error occured while decoding = \(error)")/
    }
    return nil
}

extension QueryDocumentSnapshot {
    func toObject<T: Decodable>() throws -> T {
        let jsonData = try JSONSerialization.data(withJSONObject: data(), options: [])
        let object = try JSONDecoder().decode(T.self, from: jsonData)
        
        return object
    }
}

extension QuerySnapshot {
    
    func toObject<T: Decodable>() throws -> [T] {
        let objects: [T] = try documents.map({ try $0.toObject() })
        return objects
    }
}
