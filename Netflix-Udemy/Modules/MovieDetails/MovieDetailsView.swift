//
//  MovieDetailsView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 23/07/2022.
//

import SwiftUI

struct MovieDetailsView: View {
	let movie: Movie
	
    var body: some View {
		ZStack {
			Color.black
				.ignoresSafeArea(.all)
			
			VStack {
				FixedTopBar()
				
				ScrollView(showsIndicators: false) {
					MovieDetailsHeaderView(movie: movie)
					MovieDescription()
						.foregroundColor(.white)
						.padding(.vertical, 10)
					ItemsSelector()
				}
			}
			.padding(.horizontal, 8)
		}
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: movie2)
    }
}
