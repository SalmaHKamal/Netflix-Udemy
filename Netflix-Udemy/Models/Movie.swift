//
//  Movie.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 14/07/2022.
//

import Foundation

struct Movie: Identifiable {
	let id: String
	let title: String
	let thumbnailURL: URL
	let categories: [String]
}
