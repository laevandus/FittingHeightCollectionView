//
//  ViewController.swift
//  FittingHeightCollectionView
//
//  Created by Toomas Vahter on 01.08.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let items = (0..<2).map { section in
            (0..<6).map({ "Item: \(section)-\($0)" })
        }
        let collectionViewController = FittingHeightCollectionViewController(items: items)
        collectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(collectionViewController.view)
        addChild(collectionViewController)
    }
}

