//
//  Movie.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 14/07/2022.
//

import Foundation

enum ProductType {
	case movie
	case myList
	case shows
	case all
}

struct Movie: Identifiable {
	let id: String
	let title: String
	let thumbnailURL: URL
	let categories: [String]
	var episodes: [Episode]?
}

struct Episode: Identifiable {
	let id: String
	let title: String
	let thumbnailURL: URL
	let duration: String
	let videoUrl: URL
	let description: String
}
