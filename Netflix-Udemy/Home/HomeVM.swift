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
	
	init() {
		movies = dataProvider.getMovies()
	}
}
