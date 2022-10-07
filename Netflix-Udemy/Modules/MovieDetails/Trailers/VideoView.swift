//
//  VideoView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 30/07/2022.
//

import SwiftUI
import AVKit

struct VideoView: View {
	let url: URL
	
	private var player: AVPlayer {
		AVPlayer(url: url)
	}
	
    var body: some View {
        VideoPlayer(player: player)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
		VideoView(url: URL(string: "")!)
    }
}
