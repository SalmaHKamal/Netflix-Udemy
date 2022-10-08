//
//  CategoryRow.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 14/07/2022.
//

import SwiftUI
import Kingfisher

struct CategoryRow: View {
	@ObservedObject var vm: HomeVM
	@Binding var movieDetailToShow: Movie?
	
	var body: some View {
		ForEach(vm.categories, id: \.self) { category in
			LazyVStack(alignment: .leading) {
				Text(category)
					.foregroundColor(.white)
					.font(.title)
					.fontWeight(.semibold)
				ScrollView(.horizontal, showsIndicators: false) {
					LazyHStack(spacing: 16) {
						ForEach(vm.movies[category]!) { movie in
							Button {
								movieDetailToShow = movie
							} label: {
								KFImage.url(movie.thumbnailURL, cacheKey: nil)
									.resizable()
									.scaledToFill()
									.frame(width: 150, height: 250)
									.clipped()
							}
						}
					}
				}
			}
		}
	}
}
