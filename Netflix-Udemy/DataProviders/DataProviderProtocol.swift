//
//  DataProviderProtocol.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 14/07/2022.
//

import Foundation

protocol DataProviderProtocol {
	func getMovies() -> [String: [Movie]]
	func getItems(with type: ProductType, andGenre genre: HomeGenreList) -> [String: [Movie]]
	func search(withText text: String) -> [Movie]
}
