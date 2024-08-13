//
//  ViewController.swift
//  UILab
//
//  Created by ByteDance on 8/7/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        let listView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        listView.backgroundColor = .orange
        listView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listView)
        view.addConstraints([
            listView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        listView.collectionViewLayout = makeLayout()
        let dataSource = makeDataSource(collectionView: listView)
        listView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<String, String>()
        snapshot.appendSections(["0"])
        snapshot.appendItems(["1", "2", "3", "4", "5", "6"])
        dataSource.apply(snapshot)
    }
    
    private func makeLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func makeDataSource(collectionView: UICollectionView) -> UICollectionViewDiffableDataSource<String, String> {
        let cellRegistration = UICollectionView.CellRegistration<SquareCell, String> { cell, indexPath, itemIdentifier in
            print(cell)
        }
        return UICollectionViewDiffableDataSource<String, String>(collectionView: collectionView) { collectionView, indexPath, item in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: item
            );
        };
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

