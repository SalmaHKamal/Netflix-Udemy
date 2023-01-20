//
//  GeneralHelper.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 14/07/2022.
//

import Foundation
import SwiftUI

let movie1 = Movie(id: "1",
				   title: "Titanic",
				   thumbnailURL: URL(string: "https://m.media-amazon.com/images/I/81w5fyxTy2L._SL1500_.jpg")!,
				   categories: ["Action", "Drama", "Romance", "Thriller"],
				   episodes: nil,
				   genre: .action,
				   numSeasonsLabel: "3 Seasons",
				   castMembers: ["Salma"],
				   creatorMembers: ["Salma"],
				   description: "This is description",
				   releaseYear: 2020,
				   quality: "HD")

let movie2 = Movie(id: "2",
				   title: "Fast And Farious",
				   thumbnailURL: URL(string: "https://i.ytimg.com/vi/M_0KIXXIoQc/maxresdefault.jpg")!,
				   categories: ["Action", "Drama", "Romance", "Thriller"],
				   episodes: nil,
				   genre: .horror,
				   numSeasonsLabel: "3 Seasons",
				   castMembers: ["Salma"],
				   creatorMembers: ["Salma"],
				   description: "This is description",
				   releaseYear: 2020,
				   quality: "HD")

let movie3 = Movie(id: "3",
				   title: "Fast And Farious",
				   thumbnailURL: URL(string: "https://static.wikia.nocookie.net/fastandfurious/images/0/02/Fast_%26_Furious_4_Poster-03.jpg/revision/latest/scale-to-width-down/250?cb=20190521042423")!,
				   categories: ["Action", "Drama", "Romance", "Thriller"],
				   episodes: nil,
				   genre: .romance,
				   numSeasonsLabel: "3 Seasons",
				   castMembers: ["Salma"],
				   creatorMembers: ["Salma"],
				   description: "This is description",
				   releaseYear: 2020,
				   quality: "HD")

let series1 = Movie(id: "4",
				   title: "Fast And Farious",
				   thumbnailURL: URL(string: "https://static.wikia.nocookie.net/fastandfurious/images/0/02/Fast_%26_Furious_4_Poster-03.jpg/revision/latest/scale-to-width-down/250?cb=20190521042423")!,
					categories: ["Action", "Drama", "Romance", "Thriller"],
				   episodes: [Episode(id: "10",
									  title: "Manifest",
									  thumbnailURL: URL(string: "https://static.wikia.nocookie.net/fastandfurious/images/0/02/Fast_%26_Furious_4_Poster-03.jpg/revision/latest/scale-to-width-down/250?cb=20190521042423")!,
									  duration: "10h",
									  videoUrl: URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjE3bSYg6D5AhVKwoUKHU7DABIQ3yx6BAgIEAI&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DcIJ8ma0kKtY&usg=AOvVaw3ebu3oUpNqkmupQU8EViG1")!,
									  description: "Very interesting series")],
				   genre: .romance,
					numSeasonsLabel: "3 Seasons",
					castMembers: ["Salma"],
					creatorMembers: ["Salma"],
					description: "This is description",
					releaseYear: 2020,
					quality: "HD")

let trailer1 = Trailer(name: "Titanic",
					   videoURL: URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjE3bSYg6D5AhVKwoUKHU7DABIQ3yx6BAgIEAI&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DcIJ8ma0kKtY&usg=AOvVaw3ebu3oUpNqkmupQU8EViG1")!,
					   thumbnailImageURL: URL(string: "https://m.media-amazon.com/images/I/81w5fyxTy2L._SL1500_.jpg")!)

let trailer2 = Trailer(name: "Fast And Farious",
					   videoURL: URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjE3bSYg6D5AhVKwoUKHU7DABIQ3yx6BAgIEAI&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DcIJ8ma0kKtY&usg=AOvVaw3ebu3oUpNqkmupQU8EViG1")!,
					   thumbnailImageURL: URL(string: "https://i.ytimg.com/vi/M_0KIXXIoQc/maxresdefault.jpg")!)

let trailer3 = Trailer(name: "Fast And Farious",
					   videoURL: URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjE3bSYg6D5AhVKwoUKHU7DABIQ3yx6BAgIEAI&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DcIJ8ma0kKtY&usg=AOvVaw3ebu3oUpNqkmupQU8EViG1")!,
					   thumbnailImageURL: URL(string: "https://static.wikia.nocookie.net/fastandfurious/images/0/02/Fast_%26_Furious_4_Poster-03.jpg/revision/latest/scale-to-width-down/250?cb=20190521042423")!)

//extension LinearGradient {
//	var blackOpacity
//}
