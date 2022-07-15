//
//  HomeHeaderView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 15/07/2022.
//

import SwiftUI
import Kingfisher

struct HomeHeaderView: View {
	// MARK: - Variables
	let movie: Movie
	
	// MARK: - Helper Methods
	func isLastMovieCategory(_ cat: String) -> Bool {
		let catIndex = movie.categories.firstIndex(of: cat)
		return catIndex == movie.categories.count - 1
	}
	
	// MARK: - Body
    var body: some View {
		ZStack {
			KFImage.url(URL(string: "https://m.media-amazon.com/images/I/81w5fyxTy2L._SL1500_.jpg"),
						cacheKey: nil)
				.resizable()
//				.scaledToFill()
				.clipped()
			
			VStack {
				Spacer()
				HStack {
					ForEach(movie.categories, id: \.self) { category in
						Text(category)
							.font(.footnote)
						if !isLastMovieCategory(category) {
							Circle().foregroundColor(.green)
								.frame(width: 5, height: 5)
						}
					}
				}
				HStack {
					Spacer()
					VerticalButton(isOnImageName: "checkmark", isOffImageName: "plus", text: "My List") {
						//
					}
					Spacer()
					WhiteButton(text: "Play", imageName: "play.fill") {
						//
					}.frame(width: 120)
					
					Spacer()
					VerticalButton(isOnImageName: "info.circle", isOffImageName: "info.circle", text: "info") {
						//
					}
					Spacer()
				}
			}
			.foregroundColor(.white)
			.background(LinearGradient(colors: [.black.opacity(0),
												.black],
									   startPoint: .top,
						   endPoint: .bottom).padding(.top, 200))
			
		}
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
		HomeHeaderView(movie: movie1)
    }
}
