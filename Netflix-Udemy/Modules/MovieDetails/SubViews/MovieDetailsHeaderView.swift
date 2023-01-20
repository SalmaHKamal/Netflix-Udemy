//
//  MovieDetailsHeaderView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 23/07/2022.
//

import SwiftUI
import Kingfisher

struct MovieDetailsHeaderView: View {
	let movie: Movie?
	let screenSize = UIScreen.main.bounds
	let horizontalLabelPadding: CGFloat = 16
	
    var body: some View {
		VStack {
			KFImage(movie?.thumbnailURL)
				.resizable()
				.scaledToFill()
				.frame(width: screenSize.width * 0.4 , height: 250)
				.clipped()
			
			HStack {
				// like button
				Image(systemName: "hand.thumbsup.fill")
					
				
				// release year
				Text(movie?.releaseYearText ?? "")
				
				// type
				ZStack {
					Rectangle()
						.foregroundColor(.gray)
						.frame(width: "TV-MA".getTextWidth(withFont: UIFont.systemFont(ofSize: 14)) + horizontalLabelPadding, height: 30)
					Text("TV-MA")
						.foregroundColor(.white)
				}
				
				// seasons
				Text(movie?.numSeasonsLabel ?? "")
				
				// show type
				ZStack {
					RoundedRectangle(cornerRadius: 4)
						.stroke(.gray, lineWidth: 3)
						.frame(width: (movie?.quality ?? "").getTextWidth(withFont: UIFont.systemFont(ofSize: 14)) + horizontalLabelPadding , height: 30)
					Text(movie?.quality ?? "")
				}
			}
			
			Text("Watch Season 3 now")
			WhiteButton(text: "Play", imageName: "play.fill", color: .red) {
				//
			}
			.padding(.horizontal, 10)
		}
		.foregroundColor(.white)
		
    }
}

struct MovieDetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.black
				.ignoresSafeArea(.all)
			MovieDetailsHeaderView(movie: movie1)
		}
    }
}

//struct TextWithBackgroundView: View {
//	enum BackgroundType {
//	case filled(borderWidth: CGFloat?, borderColor: Color?, fillColor: Color)
//	case unfilled(borderWidth: CGFloat, borderColor: Color)
//
//	var borderWidth: CGFloat {
//		switch self {
//		case .filled(let borderWidth, _, _):
//			return borderWidth ?? 0
//
//		case .unfilled(let borderWidth, _):
//			return borderWidth
//		}
//	}
//
//	var borderColor: Color {
//		switch self {
//		case .filled(_, let borderColor, _):
//			return borderColor ?? .clear
//
//		case .unfilled(_, let borderColor):
//			return borderColor
//		}
//	}
//
//	var fillColor: Color {
//		switch self {
//		case .filled(_, _, let fillColor):
//			return fillColor
//		case .unfilled:
//			return .clear
//		}
//	}
//}
//
//	let backgroundType: BackgroundType
//	let text: String
//
//	var body: some View {
//		ZStack {
//			Rectangle()
//				.stroke(backgroundType.borderColor,
//						lineWidth: backgroundType.borderWidth)
//				.background(backgroundType.fillColor)
//				.frame(width: 60, height: 30)
//			Text(text)
//		}
//	}
//}
