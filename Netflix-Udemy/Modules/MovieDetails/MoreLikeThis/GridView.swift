//
//  MoreLikeThisView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 29/07/2022.
//

import SwiftUI
import Kingfisher

struct GridView: View {
	let movies: [Movie]
	
	let screen = UIScreen.main.bounds
	var itemWidth: CGFloat {
		screen.width / 3.15
	}
	
	let columns: [GridItem] = [
		GridItem(.flexible()),
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	@State var movieToShow: Movie? = nil
	
    var body: some View {
		ScrollView {
			LazyVGrid(columns: columns) {
				ForEach(movies, id: \.id) { movie in
					Button {
						movieToShow = movie
					} label: {
						KFImage(movie.thumbnailURL)
							.resizable()
							.scaledToFill()
							.frame(width: itemWidth, height: 200)
							.clipped()
					}


				}
			}
		}
		.fullScreenCover(isPresented: .constant(movieToShow != nil)) {
			MovieDetailsView(movie: movieToShow!) {
				movieToShow = nil
			}
		}
    }
}

struct MoreLikeThisView_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.black
				.ignoresSafeArea(.all)
			
			GridView(movies: [movie1, movie2, movie3, movie3, movie2, movie3])
		}
		.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
