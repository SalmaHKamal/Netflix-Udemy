//
//  NetworkManager.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 08/01/2023.
//

import Foundation

struct DetailsModel: Decodable {
	struct NetflixMovie: Decodable {
		struct Creator: Decodable {
			let id: Int
			let name: String
		}
		struct NetflixGenre: Decodable {
			let id: Int
			let name: String
		}
		struct Synopsis: Decodable {
			let evidenceKey: String
			let text: String
		}
		enum `Type`: String, Decodable {
			case show, movie
		}
		struct Delivery: Decodable {
			let quality: String
		}
		
		let id: Int
		let type: `Type`
		let title: String
		let releaseYear: Int
	//	let quality:
		let cast: [Creator]
		let creators: [Creator]
		let genres: [NetflixGenre]
		let synopsis: String
		let numSeasonsLabel: String
		let delivery: Delivery
	}
	
	let titleId: String
	let details: NetflixMovie
}

extension DetailsModel: MovieAdapterProtocol {
	func convert() -> Movie {
		Movie(id: titleId,
			  title: details.title,
			  thumbnailURL: URL(string: "https://occ-0-1168-299.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABSpqYf-qwjTo6Bv_bRrj9_-f_Pi-CYcNZ1ICnyrp7a8CD2Cu4TyrntigqIw7CMFMj8f_Lr3zHq6G2WtkHs_bc8vsqISuGHe4lFyT.webp?r=fc0")!,
			  categories: details.genres.map({ $0.name}),
			  genre: .action,
			  numSeasonsLabel: details.numSeasonsLabel,
			  castMembers: details.cast.map({ $0.name }),
			  creatorMembers: details.creators.map({ $0.name }),
			  description: details.synopsis,
			  releaseYear: details.releaseYear,
			  quality: details.delivery.quality)
	}
}

protocol MovieAdapterProtocol {
	func convert() -> Movie
}

struct NetworkManager: DataProviderProtocol {
	private let request: RequestProtocol
	
	init(request: RequestProtocol) {
		self.request = request
	}
	
	func getMovies() -> [String : [Movie]] {
		return ["none":[]]
	}
	
	func getItems(with type: ProductType, andGenre genre: HomeGenreList) -> [String : [Movie]] {
		return ["none":[]]
	}
	
	func search(withText text: String) -> [Movie] {
		return []
	}
	
	func getDetails(for id: String) async throws -> Movie? {
		guard let details: [DetailsModel] = try await request.start(DetailsEndPoint(ids: [id])) else {
			return nil
		}
		return details.first?.convert()
	}
}
