//
//  TVEpisodes.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Bianca Brown on 10/2/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct EpisodeWrapper: Codable {
    let name: String?
    let season: Int
    let number: Int
    let image: imgWrapper
    let summary: String
}

struct imgWrapper: Codable {
    let medium: String
}
