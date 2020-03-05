//
//  SellItemViewController.swift
//  Firebase-Demo
//
//  Created by Lilia Yudina on 3/2/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SellItemViewController: UIViewController {
    
    @IBOutlet weak var collectioView: UICollectionView!
    
    // data for collection view
    private var categories = Category.getCategories()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectioView.dataSource = self
        collectioView.delegate = self
    }
    


}

extension SellItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCell else {
            fatalError("could not downcast to CategoryCell")
        }
        let category = categories[indexPath.row]
        cell.configureCell(for: category)
        return cell
    }
}

extension SellItemViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let spacingBetweenItems: CGFloat = 11
        let numberOfItems: CGFloat = 3
        let totalSpacing: CGFloat = (2 * spacingBetweenItems) + (numberOfItems - 1) * spacingBetweenItems
        let itemWidth: CGFloat = (maxSize.width - totalSpacing) / numberOfItems
        let itemHeight: CGFloat = maxSize.height * 0.20
        return CGSize(width: itemWidth, height: itemHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insertForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: segue to CreateItemViewController
        let category = categories[indexPath.row]
        let mainViewSB = UIStoryboard(name: "MainView", bundle: nil)
        let createItemVC = mainViewSB.instantiateViewController(identifier: "CreateItemViewController") { coder in
            return CreateItemViewController(coder: coder, category: category)
        }
        // present in a navigation controller
        present(UINavigationController(rootViewController: createItemVC), animated: true)
    }
}
