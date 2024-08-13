//
//  Square.swift
//  UILab
//
//  Created by ByteDance on 8/11/24.
//

import UIKit

class SquareCell : UICollectionViewCell {
    
    @objc private func onTap(sender: UITapGestureRecognizer) {
        print(sender.view?.frame)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        let view = UIControl()
//        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTap));
//        addGestureRecognizer(gestureRecognizer);
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        contentView.addSubview(view)
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
