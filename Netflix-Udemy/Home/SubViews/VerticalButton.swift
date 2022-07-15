//
//  VerticalButton.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 15/07/2022.
//

import SwiftUI

struct VerticalButton: View {
	// MARK: - Variables
	let isOnImageName: String
	let isOffImageName: String
	let isOn = false
	let text: String
	let action: () -> Void
	
	// MARK: - Body
    var body: some View {
		Button(action: action) {
			VStack {
				Image(systemName: isOn ? isOnImageName : isOffImageName)
					.font(.system(size: 20))
				Text(text)
			}
		}
    }
}

struct VerticalButton_Previews: PreviewProvider {
    static var previews: some View {
		VerticalButton(isOnImageName: "play.fill", isOffImageName: "play.fill", text: "My List") {
			// print
		}
    }
}
