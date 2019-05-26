//
//	Profile.swift
//
//	Create by Apple on 23/5/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Profile : Codable {

	let categories : [Category]?
	let color : String?
	let createdAt : String?
	let currentUserCollections : [String]?
	let height : Int?
	let id : String?
	let likedByUser : Bool?
	let likes : Int?
	let links : Link?
	let urls : Url?
	let user : User?
	let width : Int?


	enum CodingKeys: String, CodingKey {
		case categories = "categories"
		case color = "color"
		case createdAt = "created_at"
		case currentUserCollections = "current_user_collections"
		case height = "height"
		case id = "id"
		case likedByUser = "liked_by_user"
		case likes = "likes"
		case links
		case urls
		case user
		case width = "width"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		categories = try values.decodeIfPresent([Category].self, forKey: .categories)
		color = try values.decodeIfPresent(String.self, forKey: .color)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		currentUserCollections = try values.decodeIfPresent([String].self, forKey: .currentUserCollections)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		likedByUser = try values.decodeIfPresent(Bool.self, forKey: .likedByUser)
		likes = try values.decodeIfPresent(Int.self, forKey: .likes)
        links = try values.decode(Link.self, forKey: .links)
		urls = try values.decode(Url.self, forKey: .urls)
		user = try! values.decode(User.self, forKey: .user)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
	}


}

extension Profile: Hashable, Equatable {
    var hashValue: Int {
        return id!.hashValue
    }
    
    
    static func == (lhs: Profile, rhs: Profile) -> Bool {
        return lhs.user?.username == rhs.user?.username || lhs.user?.name == rhs.user?.name
    }

}

