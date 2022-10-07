//
//  FixedTopBar.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 23/07/2022.
//

import SwiftUI

struct FixedTopBar: View {
	var body: some View {
		HStack {
			Spacer()
			Button {
				//
			} label: {
				Image(systemName: "xmark.circle")
					.font(.title2)
					.foregroundColor(.white)
			}.buttonStyle(PlainButtonStyle())
		}
		.padding()
	}
}
