//
//  ItemsSelector.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 29/07/2022.
//

import SwiftUI

enum MovieDetailItem: CaseIterable {
	case episode
	case trailers
	case moreLikeThat
	
	var value: String {
		switch self {
		case .episode:
			return "Episodes".uppercased()
		case .trailers:
			return "Trailers & More".uppercased()
		case .moreLikeThat:
			return "More Like That".uppercased()
		}
	}
	
	@ViewBuilder
	var contentView: some View {
		switch self {
		case .episode:
			EpisodesView()
		case .trailers:
			TrailersView(trailers: [trailer1, trailer2, trailer3])
		case .moreLikeThat:
			MoreLikeThisView(movies: [movie3, movie2, movie1])
		}
	}
}

struct ItemsSelector: View {
	// MARK: - Variables
	@State var selectedItem: MovieDetailItem = .episode
	
	// MARK: - Body
    var body: some View {
		VStack {
			ItemsBarView(selectedItem: $selectedItem)
			
			// Content
			selectedItem.contentView
		}
		.foregroundColor(.white)
    }
}

struct ItemsSelector_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.black
				.ignoresSafeArea(.all)
			
			ItemsSelector()
		}
    }
}
