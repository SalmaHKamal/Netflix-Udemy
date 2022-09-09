//
//  HomeHeaderList.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 15/07/2022.
//

import SwiftUI

enum HomeTopListItem: CaseIterable {
	case shows
	case movies
	case myList
	
	var productType: ProductType {
		switch self {
		case .shows:
			return .shows
		case .movies:
			return .movie
		case .myList:
			return .myList
		}
	}
	
	var displayText: String {
		switch self {
		case .shows:
			return "TV Shows"
		case .movies:
			return "Movies"
		case .myList:
			return "My List"
		}
	}
}

enum HomeViewState {
	case `default`
	case edit
}

struct HomeHeaderList: View {
	let vm: HomeVM
	@Binding var currentItems: [HomeTopListItem]
	@Binding var homeViewState: HomeViewState
	@Binding var selectedListItem: HomeTopListItem?
	@Binding var overlayItemsToShow: [String: Bool]?
	
	var body: some View {
		HStack(spacing: homeViewState == .default ? 0 : 16) {
			Button {
				overlayItemsToShow = nil
				selectedListItem = nil
				homeViewState = .default
				vm.getItems(with: .all)
			} label: {
				Image("logo")
					.resizable()
					.scaledToFit()
					.frame(width: 50)
			}

			// default screen state with all list items
			if homeViewState == .default {
				Spacer()
				ForEach(currentItems, id: \.self) { item in
					Button {
						overlayItemsToShow = nil
						selectedListItem = item
						homeViewState = .edit
						vm.getItems(with: item.productType)
					} label: {
						Text(item.displayText)
					}
					
					Spacer()
				}
			// state for selected product type with genre dropdown
			} else {
			
				Button {
					var items = ["Home": false]
					_ = HomeTopListItem.allCases.map({ items.updateValue($0 == selectedListItem,
																		 forKey: $0.displayText) })
					overlayItemsToShow = items
					
				} label: {
					Text(selectedListItem?.displayText ?? "")
						.font(.system(size: 20))
					Image(systemName: "arrowtriangle.down.fill")
						.foregroundColor(.white)
						.font(.system(size: 10))
				}
				
				Button {
					// show overlay
				} label: {
					Text("All Genre")
					Image(systemName: "arrowtriangle.down.fill")
						.foregroundColor(.white)
						.font(.system(size: 10))
				}
				Spacer()
			}
		}
		.foregroundColor(.white)
		.padding(.leading, 10)
		.padding(.trailing, 30)
	}
}
