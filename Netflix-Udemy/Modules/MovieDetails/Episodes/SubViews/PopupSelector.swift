//
//  PopupSelector.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 13/08/2022.
//

import SwiftUI

struct PopupSelector: View {
	let displayName: String
	let imageName: String = "chevron.down"
	let optionsList: [String] = ["Season 1", "Season 2", "Season 3"]
	@State var shouldShowOverlay = false
	
    var body: some View {
		
		Button {
			shouldShowOverlay = true
		} label: {
			HStack {
				Text(displayName)
				Image(systemName: imageName)
			}
		}
		.fullScreenCover(isPresented: $shouldShowOverlay) {
			SelectorOverlay(options: optionsList, shouldShowOverlay: $shouldShowOverlay)
		}
    }
}

struct SelectorOverlay: View {
	let options: [String]
	@Binding var shouldShowOverlay: Bool
	@State var selectedIndex = 0
	var completion: ((_ selectedIndex: Int) -> Void)? = nil
	
	var body: some View {
		ZStack {
			Color.black
				.opacity(0.9)
				.ignoresSafeArea(.all)
			
			Spacer()
			VStack {
				// options list

				ScrollView {
					
					ForEach(Array(options.enumerated()), id: \.offset) { index, option in
						Button {
							selectedIndex = index
						} label: {
							Text(option)
								.font(index == selectedIndex ? .largeTitle : .title)
								.padding(.bottom, 40)
								.foregroundColor(index == selectedIndex ? .white : .gray)
						}
					}
				}
				
				// close button
				Spacer()
				Button {
					completion?(selectedIndex)
					shouldShowOverlay = false
				} label: {
					Image(systemName: "multiply.circle.fill")
						.font(.system(size: 50))
				}
				.padding(.bottom, 20)
			}
		
		}
		.foregroundColor(.white)
		
	}
}

struct PopupSelector_Previews: PreviewProvider {
    static var previews: some View {
//		VStack {
//			Text("test")
//			Spacer()
			PopupSelector(displayName: "Seasons")
//		}
    }
}
