//
//  EndPointsProtocol.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 08/01/2023.
//

import Foundation

protocol EndPointsProtocol {
	var path: String { get }
}

extension EndPointsProtocol {
	var baseUrl: String {
		"https://netflix54.p.rapidapi.com/title"
	}
}

