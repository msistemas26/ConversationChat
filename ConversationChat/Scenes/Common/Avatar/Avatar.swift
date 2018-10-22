//
//  Avatar.swift
//  Contact
//
//  Created by Raul Humberto Mantilla Assia on 10/18/18.
//  Copyright © 2018 rmantilla. All rights reserved.
//

import UIKit

class Avatar: UIView {

    @IBOutlet weak var onlineIndicatorImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var initials: UILabel!
    
    static func fromXib() -> Avatar? {
        guard let view = Bundle(for: Avatar.self).loadNibNamed(String(describing: Avatar.self), owner: self, options: nil)?.first as? Avatar else { return nil }
        return view
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(){
        self.frame = (self.superview?.frame)!
        self.frame.origin.y = 0
        self.frame.origin.x = 0
        
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleRightMargin]
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true;
    }
    
    func setup(initials: String) {
        setup()
        self.imageView.backgroundColor = UIColor.lightGray
        self.initials.text = initials
        //showData(viewModel: viewModel)
    }
    
    private func showData(viewModel: ListContacts.FetchContacts.ViewModel.DisplayedContact) {
        //title.text = viewModel.name
    }

}
