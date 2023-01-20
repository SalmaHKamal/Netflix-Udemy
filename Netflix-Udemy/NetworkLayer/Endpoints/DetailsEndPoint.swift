//
//  DetailsEndPoint.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 08/01/2023.
//

import Foundation

struct DetailsEndPoint: EndPointsProtocol {
	let ids: [String]
	
	var idsString: String {
		ids.joined(separator: ",")
	}
	var path: String {
		baseUrl + "/details/?ids=\(idsString)&lang=en"
	}
}
