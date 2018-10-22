//
//  Avatar.swift
//  Contact
//
//  Created by Raul Humberto Mantilla Assia on 10/18/18.
//  Copyright © 2018 rmantilla. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Avatar: UIView {

    @IBOutlet weak var onlineIndicatorImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var initials: UILabel!
    
    static func fromXib() -> Avatar? {
        guard let view = Bundle(for: Avatar.self).loadNibNamed(String(describing: Avatar.self), owner: self, options: nil)?.first as? Avatar else { return nil }
        return view
    }
    
    func setup(){
        self.initials.text = ""
        self.imageView.backgroundColor = UIColor.lightGray
        self.frame = (self.superview?.frame)!
        self.frame.origin.y = 0
        self.frame.origin.x = 0
        self.imageView.layer.cornerRadius = self.frame.width / 2
        self.imageView.layer.masksToBounds = true
    }
    
    func setImage(_ image: UIImage) {
        setup()
        imageView.image = image
    }
    
    func setImage(withUrl url: String) {
        setup()
        
        let imageFilter = AspectScaledToFillSizeFilter(size: imageView.frame.size)
        
        guard let url = URL(string: url) else {
            return
        }
        
        imageView.af_setImage(withURL: url, placeholderImage: nil, filter: imageFilter, progress: nil, imageTransition: .noTransition, runImageTransitionIfCached: false, completion: { (response) in
            let imageFilter = AspectScaledToFillSizeFilter(size: self.imageView.frame.size)
            self.imageView.backgroundColor = UIColor(patternImage:imageFilter.filter(response.result.value!))
        })
    }
    
    func setInitials(_ initials: String) {
        setup()
        self.initials.text = initials
    }
    
    func setOnlineIndicator(_ iOnline: Bool) {
        self.onlineIndicatorImageView.layer.cornerRadius = self.onlineIndicatorImageView.frame.width / 2
        self.onlineIndicatorImageView.layer.masksToBounds = true
        onlineIndicatorImageView.backgroundColor = iOnline ? UIColor.green : UIColor.gray
    }
}
