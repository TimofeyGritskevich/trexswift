//
//  CoverCell.swift
//  Trex
//
//  Created by Tima on 28.09.2018.
//  Copyright © 2018 Timofey Gritkevich. All rights reserved.
//

import UIKit

class CoverCell: BaseCell {
    
    var premiere: Premiere? {
        didSet {
            
            if let name = premiere?.coverImageName {
                Manager.getCover(coverURL: name, completion: { (image) in
                    self.coverImageName.image = image
                })
            }
        }
    }
    
    let coverImageName: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override func setupViews() {
        
        addSubview(coverImageName)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: coverImageName)
        addConstraintsWithFormat(format: "V:|-16-[v0]-16-|", views: coverImageName)
    }
}
