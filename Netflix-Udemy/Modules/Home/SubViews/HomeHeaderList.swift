//
//  HomeHeaderList.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 15/07/2022.
//

import SwiftUI

struct HomeHeaderList: View {
	var body: some View {
		HStack {
			Button {
				
			} label: {
				Image("logo")
					.resizable()
					.scaledToFit()
					.frame(width: 50)
			}

			Spacer()
			
			Button {
				
			} label: {
				Text("TV Shows")
			}
			
			Spacer()
			
			Button {
				
			} label: {
				Text("Movies")
			}
			
			Spacer()
			
			Button {
				
			} label: {
				Text("My List")
			}
			
		}
		.foregroundColor(.white)
		.padding(.leading, 10)
		.padding(.trailing, 30)
	}
}
