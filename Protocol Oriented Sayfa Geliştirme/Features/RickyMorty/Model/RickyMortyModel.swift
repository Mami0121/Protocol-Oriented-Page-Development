//
//  RickyMortyModel.swift
//  Protocol Oriented Sayfa Geliştirme
//
//  Created by Muhammet on 14.08.2022.
//

import Foundation

struct PostModel: Codable {
    let info: Info?
    let results: [Result]?
   
    enum CodingKeys: String, CodingKey{
        case info
        case results
    }
}

struct Info: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    
    enum CodingKeys: String, CodingKey{
        case count
        case pages
        case next
    }
}

struct Result: Codable {
    let ıd: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Location?
    let location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
    
    enum CodingKeys: String, CodingKey{
        case ıd
        case name
        case status
        case species
        case type
        case gender
        case origin
        case location
        case image
        case episode
        case url
        case created
    }
}

struct Location: Codable {
    let name: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey{
        case name
        case url
    }
}

