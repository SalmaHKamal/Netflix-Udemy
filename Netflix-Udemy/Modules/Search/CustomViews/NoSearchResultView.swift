//
//  NoSearchResultView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 03/10/2022.
//

import SwiftUI

struct NoSearchResultView: View {
    var body: some View {
		ZStack {
			Color.black
				.ignoresSafeArea(.all)
			
			VStack() {
				Text("Oh darn. We don't have that.")
					.font(.system(size: 25, weight: .bold, design: .default))
					.padding(.bottom, 1)
				Text("Try searching for another movie, show, actor, director, or genre")
					.font(.body)
					.foregroundColor(.gray)
					.multilineTextAlignment(.center)
			}
			.foregroundColor(.white)
			.padding(.horizontal, 16)
		}
    }
}

struct NoSearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        NoSearchResultView()
    }
}
