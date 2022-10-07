//
//  SearchView.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 02/10/2022.
//

import SwiftUI

struct SearchView: View {
	@ObservedObject var vm = SearchVM()
	var model: [Movie] {
		vm.items.values.first ?? []
	}
	var title: String {
		vm.items.keys.first ?? ""
	}
	var viewMode: SearchViewState {
		vm.viewMode
	}
	
    var body: some View {
		ZStack {
			Color.black
				.ignoresSafeArea(.all)
			
			VStack {
				SearchViewTopBar(onTextChange: { searchText in
					vm.search(forText: searchText)
				})
					.padding(.bottom, 10)
				ScrollView {
					viewMode.getView(withModel: model)
				}
				.padding(.horizontal, 16)
			}
			Spacer()
		}
    }
}

struct SearchViewTopBar: View {
	var onTextChange: ((String) -> Void)?
	let screenWidth = UIScreen.main.bounds.width
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	
	var body: some View {
		HStack {
			Button {
				presentationMode.wrappedValue.dismiss()
			} label: {
				Image(systemName: "chevron.left")
					.font(.title3)
					.foregroundColor(.white)
			}
			SearchBar(width: screenWidth * 0.9, onTextChangeCompletion: onTextChange)
		}
	}
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
		SearchView()
    }
}
