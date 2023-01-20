//
//  MovieDetailsVM.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 08/01/2023.
//

import Foundation
import Combine

class MovieDetailsVM: ObservableObject {
	private var provider: DataProviderProtocol = NetworkManager(request: Request())
	
	func set(provider: DataProviderProtocol) {
		self.provider = provider
	}
	
	func fetch() async throws -> Movie? {
		return try await provider.getDetails(for: "80057281")
	}
}
