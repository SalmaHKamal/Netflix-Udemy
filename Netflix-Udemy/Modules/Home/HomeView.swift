//
//  HomeView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 14/07/2022.
//

import SwiftUI

struct HomeView: View {
	@ObservedObject var vm = HomeVM()
	let screen = UIScreen.main.bounds
	@State var homeViewState: HomeViewState = .default
	@State var selectedListItem: HomeTopListItem = .home
	@State var selectedGenre: HomeGenreList = .all
	@State var overlayItemsToShow: [String: Bool]?
	@State var shouldShowHomeListItemsOverlay = false
	@State var shouldShowGenresOverlay = false
	var selectedTopListItemIndex: Int {
		return vm.homeListItems.firstIndex(of: selectedListItem) ?? 0
	}
	
    var body: some View {
		ZStack {
			Color.black
				.edgesIgnoringSafeArea(.all)

			ScrollView(showsIndicators: false) {
				ZStack(alignment: .top) {
					HomeHeaderView(movie: movie1)
						.frame(width: screen.width, height: 500)
						.padding(.top, -50)
					HomeHeaderList(vm: vm,
								   homeViewState: $homeViewState,
								   selectedListItem: $selectedListItem,
								   shouldShowHomeListItemsOverlay: $shouldShowHomeListItemsOverlay,
								   shouldShowGenresOverlay: $shouldShowGenresOverlay)
				}
				CategoryRow(vm: vm)
			}
		}
		.fullScreenCover(isPresented: $shouldShowHomeListItemsOverlay) {
			SelectorOverlay(options: vm.homeListItemsDisplayText,
							shouldShowOverlay: $shouldShowHomeListItemsOverlay,
							selectedIndex: selectedTopListItemIndex) { selectedItemIndex in
				selectedListItem = vm.homeListItems[selectedItemIndex]
				selectedGenre = .all
				if selectedListItem == .home {
					homeViewState = .default
				}
				vm.getItems(with: selectedListItem.productType, and: selectedGenre)
			}
		}
		.fullScreenCover(isPresented: $shouldShowGenresOverlay) {
			SelectorOverlay(options: vm.allGenresDisplayText,
							shouldShowOverlay: $shouldShowGenresOverlay,
							selectedIndex: 0) { selectedGenreIndex in
				selectedGenre = vm.allGenres[selectedGenreIndex]
				vm.getItems(with: selectedListItem.productType, and: selectedGenre)
			}
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


