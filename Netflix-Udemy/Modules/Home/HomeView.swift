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
	@State var currentItems = HomeTopListItem.allCases
	@State var homeViewState: HomeViewState = .default
	@State var selectedListItem: HomeTopListItem?
	@State var overlayItemsToShow: [String: Bool]?
	var selectorItems: [String] {
		guard let itemsDict = overlayItemsToShow else { return [] }
		let items = itemsDict.values.compactMap({ $0 })
		return items.map({ $0.description })
	}
	var selectorSelectedIndex: Int {
		guard let selectedItem = overlayItemsToShow?.first(where: { $0.value == true }) else { return 0 }
		return selectorItems.firstIndex(of: selectedItem.key) ?? 0
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
								   currentItems: $currentItems,
								   homeViewState: $homeViewState,
								   selectedListItem: $selectedListItem,
								   overlayItemsToShow: $overlayItemsToShow)
				}
				CategoryRow(vm: vm)
			}
		}
		.sheet(isPresented: .constant(overlayItemsToShow != nil)) {
			SelectorOverlay(options: selectorItems,
							shouldShowOverlay: .constant(true),
							selectedIndex: selectorSelectedIndex)
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


