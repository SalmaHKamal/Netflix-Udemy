//
//  MoreLikeThisView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 29/07/2022.
//

import SwiftUI
import Kingfisher

struct MoreLikeThisView: View {
	let movies: [Movie]
	
//	let data = (1...100).map { "Item \($0)" }
//
//	let columns = [
//			GridItem(.adaptive(minimum: 80))
//		]
//
//		var body: some View {
//			ScrollView {
//				LazyVGrid(columns: columns, spacing: 20) {
//					ForEach(data, id: \.self) { item in
//						Text(item)
//					}
//				}
//				.padding(.horizontal)
//			}
//			.frame(maxHeight: 300)
//			.foregroundColor(.white)
//		}
	
	let screen = UIScreen.main.bounds
	var itemWidth: CGFloat {
		screen.width / 3.15
	}
	
	let columns: [GridItem] = [
		GridItem(.flexible()),
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	
    var body: some View {
		ScrollView {
			LazyVGrid(columns: columns) {
				ForEach(movies, id: \.id) { movie in
					KFImage(movie.thumbnailURL)
						.resizable()
						.scaledToFill()
						.frame(width: itemWidth, height: 200)
						.clipped()

				}
			}
		}
    }
}

struct MoreLikeThisView_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.black
				.ignoresSafeArea(.all)
			
			MoreLikeThisView(movies: [movie1, movie2, movie3, movie3, movie2, movie3])
		}
		.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
