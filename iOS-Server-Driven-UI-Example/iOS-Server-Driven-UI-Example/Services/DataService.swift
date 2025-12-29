//
//  DataService.swift
//  iOS-Server-Driven-UI-Example
//
//  Created by Ahmet Çağatay Günaydın on 29.12.2025.
//


import Foundation

final class DataService {
    
    static let shared = DataService()
    private init() {}
    
    func fetchSections() async throws -> [Section] {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }
        
        let data = try Data(contentsOf: url)
        let response = try JSONDecoder().decode([String: [Section]].self, from: data)
        return response["sections"] ?? []
    }
}
