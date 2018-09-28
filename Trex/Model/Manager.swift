//
//  Manager.swift
//  Trex
//
//  Created by Tima on 28.09.2018.
//  Copyright © 2018 Timofey Gritkevich. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Manager: NSObject {
    
    static let requestURL = "http://www.mocky.io/v2/57cffac8260000181e650041"
    
    static func getPremiere(completion: @escaping([Premiere]) -> ()) {
        
        request(requestURL).responseJSON { responseJSON in
            
            let list = JSON(responseJSON.result.value as Any)
            var premiereList = [Premiere]()
            for item in list["list"] {
                premiereList.append(Premiere.init(json: item.1))
            }
            completion(premiereList)
        }
    }
    
    static func getCover(coverURL: String, completion: @escaping(_ cover: UIImage) -> ()) {
        
        request(coverURL)
            .response { response in
                guard
                    let data = response.data,
                    let image = UIImage(data: data)
                    else { return }
                completion(image)
        }
    }
    
    
    static func setHeightForTextViews(premiere: Premiere, width: CGFloat) -> CGFloat {
        
        if let content = premiere.content, let nameRus = premiere.nameRus, let nameEng = premiere.nameEng, let premiere = premiere.premiere {
            
            let heightContent = UITextView().setContentHeight(string: content, width: width, font: UIFont(name: "HelveticaNeue", size: 12)!)
            let heightNameRus = UITextView().setContentHeight(string: nameRus, width: width, font: UIFont(name: "HelveticaNeue", size: 20)!)
            let heightNameEng = UITextView().setContentHeight(string: nameEng, width: width, font: UIFont(name: "HelveticaNeue", size: 15)!)
            let heightPremiere = UITextView().setContentHeight(string: premiere, width: width, font: UIFont(name: "HelveticaNeue", size: 15)!)
          
            return CGFloat(heightContent + heightNameRus + heightNameEng + heightPremiere)
        }
        return 0
    }
}
