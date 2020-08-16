//
//  MenuItemCell.swift
//  TecHacks2020
//
//  Created by Angela Du on 2020-08-15.
//  Copyright © 2020 Angela Du. All rights reserved.
//

import Foundation
import UIKit

class MenuItemCell: UITableViewCell {
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 7
        
        stackView.addArrangedSubviews([menuLabel, menuImage])
        
        return stackView
    }()
    
    lazy var menuImage: UIImageView = {
        let menuImage = UIImageView()
        menuImage.translatesAutoresizingMaskIntoConstraints = false
        menuImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        menuImage.heightAnchor.constraint(equalToConstant: 29).isActive = true
        return menuImage
    }()
    
    lazy var menuLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addToSubview()
        layoutItems()
    }
    
    func addToSubview() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
    }
    
    func layoutItems() {
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -80).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 17).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach(self.addArrangedSubview)
    }
}
