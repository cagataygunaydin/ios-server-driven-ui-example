//
//  ViewController.swift
//  iOS-Server-Driven-UI-Example
//
//  Created by Ahmet Çağatay Günaydın on 29.12.2025.
//


import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = ViewModel()
    
    // MARK: - UI
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        cv.dataSource = self
        cv.backgroundColor = .systemBackground
        cv.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.identifier)
        cv.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.identifier)
        return cv
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindViewModel()
        viewModel.loadSections()
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        title = "Server-Driven-UI-Example"
        view.backgroundColor = .systemBackground
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func bindViewModel() {
        viewModel.onStateChanged = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    // MARK: - Layout
    
    private func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self, viewModel.sections.indices.contains(sectionIndex) else { return nil }
            
            switch viewModel.sections[sectionIndex].type {
            case .slider:
                return createSliderSection()
            case .grid:
                return createGridSection()
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        cell.configure(with: viewModel.item(section: indexPath.section, index: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.identifier, for: indexPath) as! SectionHeaderView
        header.configure(with: viewModel.sectionTitle(at: indexPath.section))
        return header
    }
}
