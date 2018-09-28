//
//  ViewController.swift
//  Trex
//
//  Created by Tima on 28.09.2018.
//  Copyright © 2018 Timofey Gritkevich. All rights reserved.
//

import UIKit

class PremiereViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {
    
    var premiereList: [Premiere]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        premiereListUpdate()
        navigationSetup()
        collectionViewSetup()
    }
    
    func premiereListUpdate() {
        Manager.getPremiere { (premiereList) in
            DispatchQueue.main.async {
                self.premiereList = premiereList
                self.collectionView?.reloadData()
            }
        }
    }
    
    func collectionViewSetup() {
        collectionView?.backgroundColor = .white
        collectionView?.register(CinemaCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    func navigationSetup() {
        navigationItem.title = "Премьеры"
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return premiereList?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as? CinemaCell else {
            return CinemaCell()
        }
        
        cell.premiere = premiereList?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if let premiereList = premiereList {
            let height = Manager.setHeightForTextViews(premiere: premiereList[indexPath.item], width: (self.view.frame.width - 114))
            if (height + 20) > 133 {
                return CGSize(width: view.frame.width, height: height + 20)
            }
        }
        return CGSize(width: collectionView.frame.width, height: 133)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = InfoViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        if let premiere = premiereList?[indexPath.item] {
            controller.actualPremiere = premiere
        }
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.reloadData()
    }
}
