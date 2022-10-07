//
//  TopSearches.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 02/10/2022.
//

import SwiftUI
import Kingfisher

struct TopSearches: View {
	let title: String
	let shows: [Movie]
	
    var body: some View {
		LazyVStack(alignment: .leading) {
			Text(title)
				.font(.headline)
			ForEach(shows) { show in
				TopSearchesShowItem(item: show)
			}
		}
		.foregroundColor(.white)
    }
}

struct TopSearchesShowItem: View {
	let item: Movie
	@State var shouldShowVideoPlayer = false
	
	var body: some View {
		HStack {
			KFImage(item.thumbnailURL)
				.resizable()
				.scaledToFill()
				.frame(width: 100, height: 60)
				.clipped()
				.cornerRadius(3)
				
			Text(item.title)
				.font(.subheadline)
				.padding(.leading, 10)
			
			Spacer()
			Button {
				shouldShowVideoPlayer = true
			} label: {
				Image(systemName: "play.circle")
					.font(.system(size: 25))
			}
		}
		.sheet(isPresented: $shouldShowVideoPlayer) {
			VideoView(url: URL(string: "https://www.youtube.com/watch?v=inW3uM3j5G4")!)
		}
	}
}

struct TopSearches_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.black
				.ignoresSafeArea(.all)
			
			TopSearches(title: "Top Searches", shows: [movie1, movie2, movie3, series1])
		}
    }
}
