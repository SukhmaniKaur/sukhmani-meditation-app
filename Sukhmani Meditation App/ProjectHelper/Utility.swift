//
//  Utility.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 26/11/21.
//

import Foundation
import Firebase
import SDWebImage
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
    
    func getDocID() -> [String] {
        let objects: [String] = documents.map({ $0.documentID })
        return objects
    }
}

extension UIImageView{
    //MARK: - downloadCachedImage
    func downloadCachedImage(placeholder: String,urlString: String){
        //Progressive Download
        //This flag enables progressive download, the image is displayed progressively during download as a browser would do. By default, the image is only displayed once completely downloaded.
        //so this flag provide a better experience to end user
        let options: SDWebImageOptions = [.progressiveDownload,.scaleDownLargeImages]
        let placeholder = UIImage(named: placeholder)
        DispatchQueue.global().async {
            self.sd_setImage(with: URL(string: urlString), placeholderImage: placeholder, options: options) { (image, _, cacheType,_ ) in
                guard image != nil else {
                    return
                }
                //Loading cache images for better and fast performace
                guard cacheType != .memory, cacheType != .disk else {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                    return
                }
                DispatchQueue.main.async {
                    self.image = image
                }
                return
            }
        }
    }
}
