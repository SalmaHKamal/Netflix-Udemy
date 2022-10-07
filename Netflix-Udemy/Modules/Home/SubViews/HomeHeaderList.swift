//
//  HomeHeaderList.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 15/07/2022.
//

import SwiftUI

struct HomeTopListItemModel {
	let displayName: String
	let action: () -> Void
}

enum HomeTopListItem: CaseIterable {
	case home
	case shows
	case movies
	case myList
	
	var productType: ProductType {
		switch self {
		case .home:
			return .all
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
		case .home:
			return "Home"
		case .shows:
			return "TV Shows"
		case .movies:
			return "Movies"
		case .myList:
			return "My List"
		}
	}
	
	var iconName: String? {
		guard case .home = self else {
			return nil
		}
		return "logo"
	}
}

enum HomeViewState {
	case `default`
	case edit
}

struct HomeHeaderList: View {
	let vm: HomeVM
	@Binding var homeViewState: HomeViewState
	@Binding var selectedListItem: HomeTopListItem
	@Binding var shouldShowHomeListItemsOverlay: Bool
	@Binding var shouldShowGenresOverlay: Bool
	var defaultListItems: [HomeTopListItem] {
		let result = vm.homeListItems.filter({ $0 != .home })
		return result
	}

	var body: some View {
		HStack(spacing: homeViewState == .default ? 0 : 16) {
			Button {
				selectedListItem = .home
				homeViewState = .default
				vm.getItems(with: .all)
			} label: {
				Image(HomeTopListItem.home.iconName!)
					.resizable()
					.scaledToFit()
					.frame(width: 50)
			}
			
			if homeViewState == .default {
				Spacer()
				
				ForEach(defaultListItems, id: \.self) { item in
					Button {
						selectedListItem = item
						homeViewState = .edit
						vm.getItems(with: item.productType)
					} label: {
						Text(item.displayText)
					}
					Spacer()
				}
			} else {
				
				Button {
					shouldShowHomeListItemsOverlay = true
				} label: {
					Text(selectedListItem.displayText)
						.font(.system(size: 20))
					Image(systemName: "arrowtriangle.down.fill")
						.foregroundColor(.white)
						.font(.system(size: 10))
				}

				Button {
					shouldShowGenresOverlay = true
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
