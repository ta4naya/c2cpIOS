//
//  Carousel.swift
//  c2cp
//
//  Created by mac on 08.06.24.
//

import Foundation

struct Carousel: Codable, Identifiable {
    var id: Int { return carouselId }
    let carouselId: Int
    var content: String?
    var picsPath: String?
}

