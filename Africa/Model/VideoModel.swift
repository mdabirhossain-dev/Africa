//
//  VideoModel.swift
//  Africa
//
//  Created by Md Abir Hossain on 24-04-2023.
//

import Foundation


struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
