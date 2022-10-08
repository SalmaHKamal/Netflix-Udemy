//
//  SearchVM.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 10/09/2022.
//

import SwiftUI

enum SearchViewDataMode {
	case popularSearches
	case searchResult
}

enum SearchViewState {
	case data(SearchViewDataMode)
	case emptyView
	
	var title: String? {
		switch self {
		case .data(let mode):
			guard mode == .popularSearches else {
				return "Movies & TV"
			}
			return "Top Searches"
		default:
			return nil
		}
	}
	
	@ViewBuilder
	func getView(withModel model: [Movie]) -> some View {
		switch self {
		case .data(let searchViewMode):
			if searchViewMode == .popularSearches {
				TopSearches(title: title!,
								   shows: model)
			} else {
				GridView(movies: model)
			}
			
		case .emptyView:
			NoSearchResultView()
		}
	}
}

class SearchVM: ObservableObject {
	@Published var items: [String: [Movie]] = [:]
	@Published var viewMode: SearchViewState = .data(.popularSearches)
	let dataProvider: DataProviderProtocol = MockedDataProvider()
	
	init() {
		items = [
			viewMode.title!: [movie1, movie2, movie3, movie1, movie2, movie3]
		]
	}
	
	func search(forText text: String) {
		guard !text.isEmpty else {
			viewMode = .data(.popularSearches)
			items = [
				viewMode.title!: [movie1, movie2, movie3, movie1, movie2, movie3]
			]
			return
		}
		
		let shows = dataProvider.search(withText: text)
		guard !shows.isEmpty else {
			viewMode = .emptyView
			items = ["": []]
			return
		}
		
		viewMode = .data(.searchResult)
		items = [
			viewMode.title!: shows
		]
	}
}
