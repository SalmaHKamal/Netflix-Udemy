//
//  HomeVM.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 14/07/2022.
//

import Foundation

class HomeVM: ObservableObject {
	@Published var movies: [String: [Movie]]
	let dataProvider: DataProviderProtocol = MockedDataProvider()
	
	var categories: [String] {
		movies.keys.map({ String($0) })
	}
	var allGenres: [HomeGenreList] {
		HomeGenreList.allCases
	}
	var allGenresDisplayText: [String] {
		HomeGenreList.allCases.map({ $0.rawValue })
	}
	var homeListItems: [HomeTopListItem] {
		HomeTopListItem.allCases
	}
	var homeListItemsDisplayText: [String] {
		HomeTopListItem.allCases.compactMap({ $0.displayText })
	}
	
	
	init() {
		movies = dataProvider.getMovies()
	}
	
	func getItems(with type: ProductType, and genre: HomeGenreList = .all) {
		movies = dataProvider.getItems(with: type, andGenre: genre)
	}
}
