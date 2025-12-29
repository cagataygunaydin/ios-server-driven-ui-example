//
//  ViewModel.swift
//  DynamicUI
//
//  Created by Ahmet Çağatay Günaydın on 29.12.2025.
//


import Foundation

final class ViewModel {
    
    // MARK: - Properties
    
    private(set) var templates: [Template] = []
    private var currentIndex = 0
    
    var onUpdate: (() -> Void)?
    
    // MARK: - Current Template
    
    var title: String { templates[currentIndex].title }
    var subtitle: String { templates[currentIndex].subtitle }
    var showsTextField: Bool { templates[currentIndex].inputType == .text }
    var showsSecondImage: Bool { templates[currentIndex].inputType == .doubleImage }
    
    // MARK: - Actions
    
    func load() {
        Task {
            do {
                templates = try await DataService.shared.fetchTemplates()
                await MainActor.run { onUpdate?() }
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func next() {
        currentIndex = (currentIndex + 1) % templates.count
        onUpdate?()
    }
}
