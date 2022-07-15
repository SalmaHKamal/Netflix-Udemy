//
//  MockedDataProvider.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 14/07/2022.
//

import Foundation

struct MockedDataProvider: DataProviderProtocol {
	func getMovies() -> [String: [Movie]] {
		return ["Action": [movie1, movie2],
				"Romantic": [movie2, movie3, movie1],
				"Horror": [movie3, movie1, movie2, movie3]]
	}
}
