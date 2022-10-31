//
//  TableViewCell.swift
//  AvitoTest
//
//  Created by Shamil Mazitov on 26.10.2022.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    let titleLabel = UILabel()
    let avitoImageView = UIImageView()
    let phoneNumberLabel = UILabel()
    let skillsLabel = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
    }
    
    func configureCell(with titleLabelText: String, phoneLabelText: String, skillsText: String) {
        titleLabel.text = titleLabelText
        avitoImageView.image = UIImage(named: "AvitoLogo")
        phoneNumberLabel.text = "Phone number: \(phoneLabelText)"
        skillsLabel.text = "Skills: \(skillsText)"
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(avitoImageView)
        addSubview(phoneNumberLabel)
        addSubview(skillsLabel)
        
        titleLabel.layer.cornerRadius = 10
        titleLabel.layer.borderWidth = 1
        titleLabel.layer.borderColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        
        avitoImageView.clipsToBounds = true
        avitoImageView.layer.cornerRadius = 25
        avitoImageView.contentMode = .scaleAspectFit
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        avitoImageView.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        skillsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let spacing: CGFloat = 20
        
        NSLayoutConstraint.activate([
            avitoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: spacing),
            avitoImageView.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 0.1),
            avitoImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
            avitoImageView.rightAnchor.constraint(equalTo: avitoImageView.rightAnchor),
            avitoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            titleLabel.leftAnchor.constraint(equalTo: avitoImageView.rightAnchor, constant: spacing),
            titleLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 0.4),
            titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.25),
            titleLabel.topAnchor.constraint(equalTo: topAnchor,constant: spacing),
            
            phoneNumberLabel.rightAnchor.constraint(equalTo: phoneNumberLabel.rightAnchor),
            phoneNumberLabel.leftAnchor.constraint(equalTo: avitoImageView.rightAnchor, constant: spacing),
            phoneNumberLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: spacing),
            phoneNumberLabel.bottomAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor),
            
            skillsLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor,constant: spacing),
            skillsLabel.leftAnchor.constraint(equalTo: avitoImageView.rightAnchor,constant: spacing),
            skillsLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
