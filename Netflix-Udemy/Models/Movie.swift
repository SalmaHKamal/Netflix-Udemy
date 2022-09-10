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

enum HomeGenreList: String, CaseIterable {
	case all = "All Genre"
	case action = "Action"
	case romance = "Romance"
	case horror = "Horror"
	case thriller = "Thriller"
	case comedy = "Comedy"
	case drama = "Drama"
}

enum Genre: String, CaseIterable {
	case action = "Action"
	case romance = "Romance"
	case horror = "Horror"
	case thriller = "Thriller"
	case comedy = "Comedy"
	case drama = "Drama"
}

struct Movie: Identifiable {
	let id: String
	let title: String
	let thumbnailURL: URL
	let categories: [String]
	var episodes: [Episode]?
	let genre: Genre
	let numberOfSeasons: Int
}

struct Episode: Identifiable {
	let id: String
	let title: String
	let thumbnailURL: URL
	let duration: String
	let videoUrl: URL
	let description: String
}
