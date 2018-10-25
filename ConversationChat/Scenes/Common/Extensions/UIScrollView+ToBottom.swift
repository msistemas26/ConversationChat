//
//  UIScrollView.swift
//  ConversationChat
//
//  Created by Raul Humberto Mantilla Assia on 10/25/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    func scrollToBottom(animated: Bool) {
        let  scrollviewViewOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(scrollviewViewOffset, animated: animated)
    }
}
