//
//  ViewController.swift
//  DynamicUI
//
//  Created by Ahmet Çağatay Günaydın on 29.12.2025.
//


import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = ViewModel()
    
    // MARK: - UI
    
    private let imageView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }()
    
    private let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your prompt..."
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    private let firstImagePicker = ImagePickerView()
    private let secondImagePicker = ImagePickerView()
    
    private lazy var imagePickersStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstImagePicker, secondImagePicker])
        stack.spacing = 16
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var nextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Next Template", for: .normal)
        btn.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var createButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Create", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 12
        return btn
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.onUpdate = { [weak self] in self?.updateUI() }
        viewModel.load()
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        title = "Dynamic UI"
        view.backgroundColor = .systemBackground
        
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(textField)
        view.addSubview(imagePickersStack)
        view.addSubview(nextButton)
        view.addSubview(createButton)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }
        
        imagePickersStack.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(150)
        }
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(createButton.snp.top).offset(-24)
            make.centerX.equalToSuperview()
        }
        
        createButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
    }
    
    private func updateUI() {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        
        textField.isHidden = !viewModel.showsTextField
        imagePickersStack.isHidden = viewModel.showsTextField
        secondImagePicker.isHidden = !viewModel.showsSecondImage
    }
    
    // MARK: - Actions
    
    @objc private func nextTapped() {
        viewModel.next()
    }
}
