//
//  LatestNews.swift
//  c2cp
//
//  Created by mac on 07.06.24.
//

import Foundation

struct LatestNews: Identifiable, Decodable {
    var id: Int
    var content: String?
    var title: String?
    var picsPath: String?

    
    enum CodingKeys: String, CodingKey {
        case id = "postId"
        case content = "content"
        case title = "title"
        case picsPath = "picsPath"
    }
}
