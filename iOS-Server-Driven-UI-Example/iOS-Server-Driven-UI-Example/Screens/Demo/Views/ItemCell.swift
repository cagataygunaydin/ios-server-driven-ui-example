//
//  ItemCell.swift
//  iOS-Server-Driven-UI-Example
//
//  Created by Ahmet Çağatay Günaydın on 29.12.2025.
//


import UIKit
import SnapKit

final class ItemCell: UICollectionViewCell {
    
    static let identifier = "ItemCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray5
        contentView.layer.cornerRadius = 12
        
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func configure(with item: Item) {
        titleLabel.text = item.title
    }
}
