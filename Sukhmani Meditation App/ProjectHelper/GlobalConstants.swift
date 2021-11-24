//
//  GlobalConstants.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 24/11/21.
//

import Foundation
import UIKit

//MARK: - STORYBOARD
struct STORYBOARD {
    static let MAIN = UIStoryboard(name: "Main", bundle: nil)
}

//MARK: - MAIN_STORYBOARD
enum MAIN_STORYBOARD: String {
    case LaunchVC, MainVC, MeditationVC
}

//MARK: - ANIMATION
enum ANIMATION: String {
    case splashAnimation = "4099-loading"
}

//MARK:- AppColors
struct AppColors{
    static let LoaderColor =  #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
}

//MARK:- DocumentDefaultValues
struct DocumentDefaultValues{
    struct Empty{
        static let string =  ""
        static let int =  0
        static let bool = false
        static let double = 0.0
    }
}
