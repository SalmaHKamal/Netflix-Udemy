//
//  WhiteButton.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 15/07/2022.
//

import SwiftUI

struct WhiteButton: View {
	let text: String
	let imageName: String
	let action: () -> Void
	
	var body: some View {
		Button(action: action) {
			HStack {
				Spacer()
				Image(systemName: imageName)
				Text(text)
					.font(.headline)
				Spacer()
			}
			.padding(.vertical, 6)
			.background(.white)
			.foregroundColor(.black)
		}
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.black
			WhiteButton(text: "Play", imageName: "play.fill") {
				//
			}
		}
    }
}
