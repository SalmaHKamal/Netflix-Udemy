//
//  MovieDescription.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 29/07/2022.
//

import SwiftUI

struct MovieDescription: View {
    var body: some View {
		VStack(alignment: .leading) {
			Text("S2:E8 Endings and Beginnings")
				.font(.headline)
			Text("One day, Salma executes search warrant Salma executes search warrant Salma executes search warrant Salma executes search warrant.")
				.padding(.vertical, 5)
			Text("Cast: Salma, Hassan, Kamal")
				.font(.subheadline)
				.foregroundColor(.gray)
			Text("Creators: Nadra, Omar, Kareem")
				.font(.subheadline)
				.foregroundColor(.gray)
			
			HStack(spacing: 40) {
				VerticalButton(isOnImageName: "checkmark", isOffImageName: "checkmark", text: "My List") {
					//
				}
				
				VerticalButton(isOnImageName: "hand.thumbsup.fill", isOffImageName: "hand.thumbsup", text: "Rated") {
					//
				}
				
				VerticalButton(isOnImageName: "paperplane", isOffImageName: "paperplane", text: "Share") {
					//
				}
			}
			.padding(.vertical, 5)
		}
    }
}

struct MovieDescription_Previews: PreviewProvider {
    static var previews: some View {
        MovieDescription()
    }
}
