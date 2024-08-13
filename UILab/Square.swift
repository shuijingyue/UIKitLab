//
//  Square.swift
//  UILab
//
//  Created by ByteDance on 8/11/24.
//

import UIKit

class SquareCell : UICollectionViewCell {
    static let reuseIdentifier = "square-cell-reuse-identifier"
    override init(frame: CGRect) {
        super.init(frame: frame)
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        addSubview(view)
        contentView.addConstraints([
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
