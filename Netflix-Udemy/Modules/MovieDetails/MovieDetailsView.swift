//
//  MovieDetailsView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 23/07/2022.
//

import SwiftUI

struct MovieDetailsView: View {
	@State var movie: Movie?
	var closeBtnCompletion: (() -> Void)? = nil
	@ObservedObject var vm = MovieDetailsVM()
	
    var body: some View {
		ZStack {
			Color.black
				.ignoresSafeArea(.all)
			
			VStack {
				FixedTopBar(closeBtnCompletion: closeBtnCompletion)
				MovieDetailsHeaderView(movie: movie)
				
				ScrollView(showsIndicators: false) {
					MovieDescription(movie: movie)
						.foregroundColor(.white)
						.padding(.vertical, 10)
					ItemsSelector()
				}
			}
			.padding(.horizontal, 8)
		}
		.task {
			do {
				movie = try await vm.fetch()
			} catch {
				print(error.localizedDescription)
			}
		}
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: movie2)
    }
}
