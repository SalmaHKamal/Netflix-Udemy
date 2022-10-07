//
//  MockedDataProvider.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 14/07/2022.
//

import Foundation

struct MockedDataProvider: DataProviderProtocol {
	let items = [movie1, movie2, movie3, series1]
	
	func getMovies() -> [String: [Movie]] {
		var result = [String: [Movie]]()
		items.forEach({ item in
			if var movies = result[item.genre.rawValue] {
				movies.append(item)
				result.updateValue(movies, forKey: item.genre.rawValue)
			} else {
				let movies = [item]
				result.updateValue(movies, forKey: item.genre.rawValue)
			}
		})
		return result
	}
	
	func getItems(with type: ProductType, andGenre genre: HomeGenreList = .all) -> [String: [Movie]] {
		switch type {
		case .movie, .shows:
			return filter(forType: type, andGenre: genre)
			
		case .myList:
			return [:]
			
		case .all:
			return getMovies()
		}
	}
	
	func search(withText text: String) -> [Movie] {
		return items.filter { $0.title.contains(text) }
	}
}

extension MockedDataProvider {
	fileprivate func filter(forType type: ProductType, andGenre genre: HomeGenreList) -> [String: [Movie]] {
		var result = [String: [Movie]]()
		let shouldFilterGenre = genre != .all
		
		getMovies().forEach({
			let filteredMovies = $1.filter({
				let genrePredicate = shouldFilterGenre ? $0.genre.rawValue == genre.rawValue : true
				guard case .movie = type else {
					return ($0.episodes != nil) && (genrePredicate)
				}
				return ($0.episodes == nil) && (genrePredicate)
			})
			guard !filteredMovies.isEmpty else {
				result.removeValue(forKey: $0)
				return
			}
			result.updateValue(filteredMovies, forKey: $0)
		})
		
		return result
	}
}
