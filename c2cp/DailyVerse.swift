//
//  DailyVerse.swift
//  c2cp
//
//  Created by mac on 09.06.24.
//

import Foundation
struct DailyVerse: Codable, Identifiable {
    var id: Int { return dailyVerseId }
    let dailyVerseId: Int
    let verse: String?
    let picsPath: String?
}
