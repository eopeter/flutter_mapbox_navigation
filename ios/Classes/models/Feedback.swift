//
//  Feedback.swift
//  flutter_mapbox_navigation
//
//  Created by Marco Galetta on 20/05/23.
//

import Foundation

public class Feedback : Codable
{
    let rating: Int?
    let comment: String?

    init(rating: Int?,comment: String?) {
        self.rating = rating
        self.comment = comment
    }
}
