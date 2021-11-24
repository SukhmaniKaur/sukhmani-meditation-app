//
//  GlobalConstants.swift
//  NewApp
//
//  Created by MACBOOK on 15/11/21.
//

import Foundation
import UIKit

//MARK: - STORYBOARD
struct STORYBOARD {
    static let MAIN = UIStoryboard(name: "Main", bundle: nil)
}

//MARK: - TABLE_VIEW_CELL
enum TABLE_VIEW_CELL: String {
    case NewsListCell
}

//MARK: - MAIN_STORYBOARD
enum MAIN_STORYBOARD: String {
    case NewsListVC, NewsDetailVC
}

//MARK: - STATIC_LABELS
enum STATIC_LABELS: String {
    case tableView = "TableView"
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
