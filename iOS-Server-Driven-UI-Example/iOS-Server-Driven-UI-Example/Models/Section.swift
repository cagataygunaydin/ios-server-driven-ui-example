//
//  Section.swift
//  iOS-Server-Driven-UI-Example
//
//  Created by Ahmet Çağatay Günaydın on 29.12.2025.
//


import Foundation

struct Section: Codable {
    let id: String
    let title: String
    let layout: String
    let items: [Item]
    
    var type: SectionType {
        SectionType(rawValue: layout) ?? .grid
    }
}

enum SectionType: String {
    case slider
    case grid
}
