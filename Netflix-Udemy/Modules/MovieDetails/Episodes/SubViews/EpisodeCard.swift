//
//  EpisodeCard.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 09/09/2022.
//

import SwiftUI
import Kingfisher

struct EpisodeCard: View {
	@Binding var isVideoViewShown: Bool
	
    var body: some View {
		LazyVStack(alignment: .leading) {
			HStack {
				ZStack {
					KFImage.url(movie1.thumbnailURL)
						.resizable()
						.frame(width: 130, height: 80)
						.scaledToFill()
					Button {
						isVideoViewShown = true
						
					} label: {
						Image(systemName: "play.circle")
							.font(.largeTitle)
					}
				}
				VStack(alignment: .leading) {
					Text("1.Beginnings and Ends")
					Text("30m")
						.foregroundColor(.gray)
				}
				Spacer()
				Button {
					// download
				} label: {
					Image(systemName: "arrow.down.circle.fill")
						.font(.system(size: 30))
				}
				
			}
			Text("After being presumed dead, 191 passengers of the Montego Air Flight 828 try reintegrating into society. However, disturbing realities come to light, which unsettles them.")
		}
		.foregroundColor(.white)
    }
}

struct EpisodeCard_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.black
				.ignoresSafeArea(.all)
			
			EpisodeCard(isVideoViewShown: .constant(false))
		}
    }
}
