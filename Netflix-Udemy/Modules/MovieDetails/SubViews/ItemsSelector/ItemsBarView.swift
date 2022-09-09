//
//  ItemsBarView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 29/07/2022.
//

import SwiftUI

struct ItemsBarView: View {
	@Binding var selectedItem: MovieDetailItem
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 16) {
				ForEach(MovieDetailItem.allCases, id: \.self) { item in
					Button {
						selectedItem = item
						
					} label: {
						VStack {
							Rectangle()
								.frame(width: item.value.getTextWidth(withFont: .systemFont(ofSize: 18)), height: 6)
								.foregroundColor(item == selectedItem ? .red: .clear)
							Text(item.value)
								.font(.headline)
						}
					}
				}
			}
		}
	}
}

