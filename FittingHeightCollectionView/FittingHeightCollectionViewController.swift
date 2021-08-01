//
//  FittingHeightCollectionViewController.swift
//  FittingHeightCollectionView
//
//  Created by Toomas Vahter on 01.08.2021.
//

import UIKit

final class FittingHeightCollectionViewController: UICollectionViewController {
    private let items: [[String]]
    
    init(items: [[String]]) {
        self.items = items
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static let reuseIdentifier = "Cell"
    private var collectionViewHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(TextCollectionViewCell.self, forCellWithReuseIdentifier: Self.reuseIdentifier)
        collectionView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        collectionView.isScrollEnabled = false
        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 50)
        collectionViewHeightConstraint.isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionViewHeightConstraint.constant = collectionViewLayout.collectionViewContentSize.height
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.reuseIdentifier, for: indexPath) as! TextCollectionViewCell
        cell.label.text = items[indexPath.section][indexPath.item]
        return cell
    }
}

final class TextCollectionViewCell: UICollectionViewCell {
    let label = UILabel(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
        backgroundView = UIView(frame: .zero)
        backgroundView?.backgroundColor = .systemBlue
        backgroundView?.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
