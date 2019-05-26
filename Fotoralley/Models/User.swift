//
//	User.swift
//
//	Create by Apple on 23/5/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct User : Codable {

	let id : String?
	let links : Link?
	let name : String?
	let profileImage : ProfileImage?
	let username : String?


	enum CodingKeys: String, CodingKey {
		case id = "id"
		case links
		case name = "name"
		case profileImage = "profile_image"
		case username = "username"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		links = try values.decode(Link.self, forKey: .links)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		profileImage = try values.decode(ProfileImage.self, forKey: .profileImage)
		username = try values.decodeIfPresent(String.self, forKey: .username)
	}


}
