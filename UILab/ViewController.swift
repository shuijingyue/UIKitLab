//
//  ViewController.swift
//  UILab
//
//  Created by ByteDance on 8/7/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private var contentView: UIStackView!
    private lazy var dataSource = makeDataSource()
    
    override func loadView() {
        super.loadView()
        let listView = UICollectionView(frame: .zero, collectionViewLayout: makeLayout())
        collectionView = listView
        listView.backgroundColor = .orange
        listView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listView)
        view.addConstraints([
            listView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200)
        ])

//        listView.dataSource = makeDataSource(view: listView)
        listView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<String, String>()
        snapshot.appendSections(["0"])
        snapshot.appendItems(["1", "2", "3", "4", "5", "6"])
        dataSource.apply(snapshot, animatingDifferences: true)
        
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .yellow
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        let contentView = UIStackView()
        contentView.axis = .vertical
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 1000),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
        
        let button = UIControl()
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        contentView.addArrangedSubview(button)
        contentView.addArrangedSubview(UIView())
        self.contentView = contentView
    }
    
    private func makeLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .absolute(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(4)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 4
        let config = UICollectionViewCompositionalLayoutConfiguration()
        return UICollectionViewCompositionalLayout(section: section, configuration: config)
    }
    
    private func makeDataSource() -> UICollectionViewDiffableDataSource<String, String> {
        let cellRegistration = UICollectionView.CellRegistration<SquareCell, String> { cell, indexPath, itemIdentifier in
            
        }
        return UICollectionViewDiffableDataSource<String, String>(collectionView: collectionView) { collectionView, indexPath, item in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: item
            );
        };
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        contentView.constraints.forEach({print($0.secondItem)})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
    }
}

