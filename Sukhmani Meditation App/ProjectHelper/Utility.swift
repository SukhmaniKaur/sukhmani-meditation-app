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


//MARK: - UIViewController
extension UIViewController {

    static var top: UIViewController? {
        get {
            return topViewController()
        }
    }
    
    static var root: UIViewController? {
        get {
            return UIApplication.shared.windows.first?.rootViewController
        }
    }
    
    static func topViewController(from viewController: UIViewController? = UIViewController.root) -> UIViewController? {
        if let tabBarViewController = viewController as? UITabBarController {
            return topViewController(from: tabBarViewController.selectedViewController)
        } else if let navigationController = viewController as? UINavigationController {
            return topViewController(from: navigationController.visibleViewController)
        } else if let presentedViewController = viewController?.presentedViewController {
            return topViewController(from: presentedViewController)
        } else {
            return viewController
        }
    }
}

extension UIApplication {
    //MARK: - topViewController
    class func topViewController(base: UIViewController? = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}


//MARK: - User login boolean
func setIsUserLogin(isUserLogin: Bool)
{
    UserDefaults.standard.set(isUserLogin, forKey: USER_DEFAULT_KEYS.isUserLogin.rawValue)
}

func isUserLogin() -> Bool
{
    let isUserLogin = UserDefaults.standard.bool(forKey: USER_DEFAULT_KEYS.isUserLogin.rawValue)
    return (isUserLogin)
}
