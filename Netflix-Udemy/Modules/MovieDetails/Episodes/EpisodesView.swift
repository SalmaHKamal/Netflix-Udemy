//
//  EpisodesView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 13/08/2022.
//

import SwiftUI

struct EpisodesView: View {
	@State var isVideoViewShown = false
	
    var body: some View {
		VStack(alignment: .leading) {
			// selector
			PopupSelector(displayName: "Seasons")
				.foregroundColor(.white)
			
			// list of episodes
			VStack {
				EpisodeCard(isVideoViewShown: $isVideoViewShown)
			}
		}
		.sheet(isPresented: $isVideoViewShown) {
			VideoView(url: trailer1.videoURL)
		}
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.black
				.edgesIgnoringSafeArea(.all)
			EpisodesView()
		}
    }
}
