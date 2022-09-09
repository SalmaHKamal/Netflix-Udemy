//
//  MockedDataProvider.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 14/07/2022.
//

import Foundation

struct MockedDataProvider: DataProviderProtocol {
	let items = ["Action": [movie1, movie2],
				 "Romantic": [movie2, movie3, movie1],
				 "Horror": [movie3, movie1, movie2, movie3]]
	
	func getMovies() -> [String: [Movie]] {
		return items
	}
	
	func getItems(with type: ProductType) -> [String: [Movie]] {
		switch type {
		case .movie:
			return ["Action": [movie1, movie2]]
		case .myList:
			return [:]
		case .shows:
			return ["Standup-Comedy": [movie3]]
		case .all:
			return items
		}
	}
}
