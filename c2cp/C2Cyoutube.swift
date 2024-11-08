//
//  C2Cyoutube.swift
//  c2cp
//
//  Created by mac on 09.05.24.
//

import Foundation

struct C2Cyoutube: Identifiable, Decodable {
    var id: Int
    var hosts: String?
    var title: String?
    var picsPath: String?
    var videoURL: String?
    var day: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "c2CyoutubeId"
        case hosts = "hosts"
        case title = "title"
        case picsPath = "picsPath"
        case videoURL = "videoURL"
        case day = "day"
    }
}
