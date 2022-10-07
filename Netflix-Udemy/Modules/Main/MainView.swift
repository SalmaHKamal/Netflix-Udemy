//
//  MainView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 10/09/2022.
//

import SwiftUI

enum MainTabViews: Int, CaseIterable {
	case home, search, comingSoon, downloads, more
	
	var iconName: String {
		switch self {
		case .home:
			return "house"
		case .search:
			return "magnifyingglass"
		case .comingSoon:
			return "sparkles.rectangle.stack.fill"
		case .downloads:
			return "arrow.down.to.line.alt"
		case .more:
			return "line.horizontal.3"
		}
	}
	
	var displayName: String {
		switch self {
		case .home:
			return "Home"
		case .search:
			return "Search"
		case .comingSoon:
			return "Coming Soon"
		case .downloads:
			return "Downloads"
		case .more:
			return "More"
		}
	}
	
	@ViewBuilder
	var content: some View {
		switch self {
		case .home:
			HomeView()
		case .search:
			Text("Search")
		case .comingSoon:
			Text("Coming Soon")
		case .downloads:
			Text("Downloads")
		case .more:
			Text("More")
		}
	}
}

struct MainView: View {
	
	init() {
		UITabBar.appearance().barTintColor = .black
//		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)], for: .normal)
//		UITabBar.appearance().isTranslucent = false
	}
	
    var body: some View {
		TabView {
			ForEach(MainTabViews.allCases, id: \.self) { tab in
				tab.content
					.tabItem {
						VStack {
							Image(systemName: tab.iconName)
							Text(tab.displayName)
						}
					}
					.tag(tab.rawValue)
			}
		}
		.accentColor(.white)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
