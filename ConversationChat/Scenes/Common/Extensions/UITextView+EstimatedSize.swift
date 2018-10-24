//
//  String+EstimatedSize.swift
//  ConversationChat
//
//  Created by Raul Humberto Mantilla Assia on 10/24/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    func estimatedSize(withString text: String) -> CGSize {
        let size = CGSize(width: self.frame.width, height: .greatestFiniteMagnitude)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame =  NSString(string: text).boundingRect(
            with: size,
            options: options,
            attributes: [NSAttributedStringKey.font: self.font],
            context: nil)
        
        return CGSize(width: self.frame.width, height: estimatedFrame.height)
    }
}

