//
//  DataProviderProtocol.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 14/07/2022.
//

import Foundation

protocol DataProviderProtocol {
	func getMovies() -> [String: [Movie]]
}
