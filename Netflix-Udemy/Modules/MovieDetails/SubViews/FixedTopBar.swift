//
//  FixedTopBar.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 23/07/2022.
//

import SwiftUI

struct FixedTopBar: View {
	@Environment(\.presentationMode) private var presentationMode
	var closeBtnCompletion: (() -> Void)? = nil
	
	var body: some View {
		HStack {
			Spacer()
			Button {
				presentationMode.wrappedValue.dismiss()
				closeBtnCompletion?()
			} label: {
				Image(systemName: "xmark.circle.fill")
					.font(.title2)
					.foregroundColor(.white)
			}.buttonStyle(PlainButtonStyle())
		}
		.padding()
	}
}
