//
//  SearchView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 10/09/2022.
//

import SwiftUI

enum SearchBarPlaceholderLocation {
	case left, center, right
}

struct SearchBar: View {
	@State var searchText: String = ""
	@State var shouldShowPlaceholder = true
	@State var placeholderLocation: SearchBarPlaceholderLocation = .center
	var width: CGFloat = UIScreen.main.bounds.width - 32
	var onTextChangeCompletion: ((String) -> Void)?
	@State var shouldShowCloseIcon = false
	
	var body: some View {
		ZStack {
			Rectangle()
				.frame(width: width, height: 40)
				.foregroundColor(Color.secondary)
				.cornerRadius(10)
			
			HStack {
				TextFieldWithCustomPrompt(text: $searchText,
										  shouldShowPlaceholder: $shouldShowPlaceholder,
										  didCommit: {
					placeholderLocation = .center
				}, onTextChange: { newValue in
					shouldShowPlaceholder = newValue.isEmpty
					shouldShowCloseIcon = !newValue.isEmpty
					onTextChangeCompletion?(searchText)
				}) {
					HStack {
						if placeholderLocation == .center || placeholderLocation == .right {
							Spacer()
						}
						
						Image(systemName: "magnifyingglass")
						Text("Search")
						
						if placeholderLocation == .center || placeholderLocation == .left {
							Spacer()
						}
					}
					.foregroundColor(.gray)
					.animation(.easeInOut(duration: 0.1), value: placeholderLocation)
				}
				.foregroundColor(.gray)
				.onTapGesture {
					placeholderLocation = .left
				}
				
				Spacer()
				if shouldShowCloseIcon {
					Button {
						searchText = ""
					} label: {
						Image(systemName: "xmark.circle.fill")
							.foregroundColor(.gray)
					}
				}
			}
			.padding(.horizontal, 10)
			.frame(width: width)
		}
	}
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.black
				.ignoresSafeArea(.all)
			SearchBar()
		}
    }
}
