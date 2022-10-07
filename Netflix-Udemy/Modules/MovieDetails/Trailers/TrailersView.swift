//
//  TrailersView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 30/07/2022.
//

import SwiftUI
import Kingfisher

struct TrailersView: View {
	let trailers: [Trailer]
	@State var isVideoViewShown = false
	
    var body: some View {
		Group {
			ForEach(trailers) { trailer in
			TrailerItemView(trailer: trailer,
								isVideoViewShown: $isVideoViewShown)
				.foregroundColor(.white)
				.sheet(isPresented: $isVideoViewShown) {
					VideoView(url: trailer.videoURL)
				}
			}
		}
    }
}

struct TrailerItemView: View {
	let trailer: Trailer
	@Binding var isVideoViewShown: Bool
	let screenSize = UIScreen.main.bounds
	
	var body: some View {
		LazyVStack(alignment: .leading) {
			ZStack {
				KFImage(trailer.thumbnailImageURL)
					.resizable()
					.frame(width: screenSize.width, height: 200)
					.scaledToFill()
					.clipped()
				
				Button {
					isVideoViewShown = true
					
				} label: {
					Image(systemName: "play.circle")
						.font(.largeTitle)
				}
			}
			
			Text(trailer.name)
		}
	}
}

struct TrailersView_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.black
				.ignoresSafeArea(.all)
			
			TrailersView(trailers: [trailer1])
		}
    }
}
