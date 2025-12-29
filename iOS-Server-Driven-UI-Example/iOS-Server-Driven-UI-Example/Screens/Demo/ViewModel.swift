//
//  ViewModel.swift
//  iOS-Server-Driven-UI-Example
//
//  Created by Ahmet Çağatay Günaydın on 29.12.2025.
//


import Foundation

final class ViewModel {
    
    // MARK: - State
    
    enum State {
        case loaded
        case error(String)
    }
    
    // MARK: - Properties
    
    private(set) var sections: [Section] = []
    var onStateChanged: (() -> Void)?
    
    // MARK: - Data Access
    
    var numberOfSections: Int {
        sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        sections[section].items.count
    }
    
    func item(section: Int, index: Int) -> Item {
        sections[section].items[index]
    }
    
    func sectionTitle(at index: Int) -> String {
        sections[index].title
    }
    
    func sectionType(at index: Int) -> SectionType {
        sections[index].type
    }
    
    // MARK: - Load
    
    func loadSections() {
        
        Task {
            do {
                let sections = try await DataService.shared.fetchSections()
                await MainActor.run {
                    self.sections = sections
                    onStateChanged?()
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
