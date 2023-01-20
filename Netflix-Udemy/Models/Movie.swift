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
	let numSeasonsLabel: String
	let castMembers: [String]
	let creatorMembers: [String]
	let description: String
	let releaseYear: Int
	let quality: String
	
	var castText: String {
		"Cast: \(castMembers.joined(separator: ","))"
	}
	
	var creatorText: String {
		"Creators: \(creatorMembers.joined(separator: ","))"
	}
	
	var releaseYearText: String {
		"\(releaseYear)"
	}
}

struct Episode: Identifiable {
	let id: String
	let title: String
	let thumbnailURL: URL
	let duration: String
	let videoUrl: URL
	let description: String
}
