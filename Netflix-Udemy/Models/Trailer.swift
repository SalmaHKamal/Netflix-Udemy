//
//  Trailer.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 30/07/2022.
//

import Foundation

struct Trailer: Identifiable {
	let id: String = UUID().uuidString
	let name: String
	let videoURL: URL
	let thumbnailImageURL: URL
}
