//
//	Link.swift
//
//	Create by Apple on 23/5/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Link : Codable {

	let photos : String?
	let slf : String?
	let download : String?
	let html : String?
	let likes : String?


	enum CodingKeys: String, CodingKey {
		case photos = "photos"
		case slf = "self"
		case download = "download"
		case html = "html"
		case likes = "likes"
	}
	init(from decoder: Decoder) throws {
		let values = try! decoder.container(keyedBy: CodingKeys.self)
		photos = try! values.decodeIfPresent(String.self, forKey: .photos)
		slf = try! values.decodeIfPresent(String.self, forKey: .slf)
		download = try! values.decodeIfPresent(String.self, forKey: .download)
		html = try! values.decodeIfPresent(String.self, forKey: .html)
		likes = try! values.decodeIfPresent(String.self, forKey: .likes)
	}


}
