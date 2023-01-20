//
//  MovieDescription.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 29/07/2022.
//

import SwiftUI

struct MovieDescription: View {
	let movie: Movie?
	
    var body: some View {
		VStack(alignment: .leading) {
			Text(movie?.title ?? "")
				.font(.headline)
			Text(movie?.description ?? "")
				.padding(.vertical, 5)
			Text(movie?.castText ?? "")
				.font(.subheadline)
				.foregroundColor(.gray)
			Text(movie?.creatorText ?? "")
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
		MovieDescription(movie: movie1)
    }
}
