//
//  HomeView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 14/07/2022.
//

import SwiftUI

struct HomeView: View {
	var vm = HomeVM()
	let screen = UIScreen.main.bounds
	
    var body: some View {
		ZStack {
			Color.black
				.edgesIgnoringSafeArea(.all)

			ScrollView(showsIndicators: false) {
				ZStack(alignment: .top) {
					HomeHeaderView(movie: movie1)
						.frame(width: screen.width, height: 500)
						.padding(.top, -50)
					HomeHeaderList()
				}
				CategoryRow(vm: vm)
			}
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


