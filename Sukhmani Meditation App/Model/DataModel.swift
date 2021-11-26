//
//  DataModel.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 26/11/21.
//

import Foundation

struct CollectionModel: Codable {
    let name: String
    let doing_right_now: Int
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? DocumentDefaultValues.Empty.string
        doing_right_now = try values.decodeIfPresent(Int.self, forKey: .doing_right_now) ?? DocumentDefaultValues.Empty.int
    }
    
    internal init() {
        self.name = DocumentDefaultValues.Empty.string
        self.doing_right_now = DocumentDefaultValues.Empty.int
    }
}
