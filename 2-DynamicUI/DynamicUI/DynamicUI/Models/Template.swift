//
//  Template.swift
//  DynamicUI
//
//  Created by Ahmet Çağatay Günaydın on 29.12.2025.
//


import Foundation

struct Template: Codable {
    let id: String
    let title: String
    let subtitle: String
    let inputType: InputType
}

enum InputType: String, Codable {
    case text
    case singleImage
    case doubleImage
}