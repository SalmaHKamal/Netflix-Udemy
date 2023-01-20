//
//  Request.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 08/01/2023.
//

import Foundation

enum NetworkError: Error {
	case dataNotFound
}

protocol RequestProtocol {
	func start<T: Decodable>(_ endPoint: EndPointsProtocol) async throws -> T
}

struct Request: RequestProtocol {
	func start<T>(_ endPoint: EndPointsProtocol) async throws -> T where T : Decodable {
		let session = URLSession.shared
		let headers = [
			"X-RapidAPI-Key": "0ecefafd7bmshd7689e97d3cd2ddp11d9c8jsn678b50150f76",
			"X-RapidAPI-Host": "netflix54.p.rapidapi.com"
		]

		let request = NSMutableURLRequest(url: NSURL(string: endPoint.path)! as URL,
												cachePolicy: .useProtocolCachePolicy,
											timeoutInterval: 10.0)
		request.httpMethod = "GET"
		request.allHTTPHeaderFields = headers
		
		let (data, response) = try await session.data(for: request as URLRequest)
		
		guard (response as? HTTPURLResponse)?.statusCode == 200 else {
			throw NetworkError.dataNotFound
		}
		
		return try JSONDecoder().decode(T.self, from: data)
	}
}
