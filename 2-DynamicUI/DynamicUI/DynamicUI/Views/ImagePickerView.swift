//
//  ImagePickerView.swift
//  DynamicUI
//
//  Created by Ahmet Çağatay Günaydın on 29.12.2025.
//


import UIKit
import SnapKit

final class ImagePickerView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "+"
        label.font = .systemFont(ofSize: 32, weight: .light)
        label.textColor = .systemGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        layer.cornerRadius = 12
        
        addSubview(label)
        label.snp.makeConstraints { $0.center.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) { fatalError() }
}
