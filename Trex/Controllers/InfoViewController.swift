//
//  InfoViewController.swift
//  Trex
//
//  Created by Tima on 28.09.2018.
//  Copyright © 2018 Timofey Gritkevich. All rights reserved.
//

import UIKit
import SwiftyJSON

class InfoViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var coverImage = UIImage()
    var actualPremiere = Premiere(json: JSON())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
    }
    
    func collectionViewSetup() {
        collectionView?.backgroundColor = .white
        collectionView?.register(CinemaContentCell.self, forCellWithReuseIdentifier: "CinemaContentCell")
        collectionView?.register(CoverCell.self, forCellWithReuseIdentifier: "CoverCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.orientation.isLandscape {
            print(UIDevice.current.orientation.isLandscape)
            return CGSize(width: view.frame.width/2, height: view.frame.height)
        }
        return CGSize(width: view.frame.width, height: view.frame.height/2)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoverCell", for: indexPath) as? CoverCell else {
                return CoverCell()
            }
            cell.premiere = actualPremiere
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CinemaContentCell", for: indexPath) as? CinemaContentCell else {
                return CinemaContentCell()
            }
            cell.premiere = actualPremiere
            return cell
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.reloadData()
    }
}
