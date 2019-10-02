//
//  TVShows.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Bianca Brown on 10/1/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct showModel: Codable {
    let show: ShowWrapper
}

struct ShowWrapper: Codable {
    let rating: Double
    let name: String
    let image: String
}
