//
//  ScrollViewContainer.swift
//  ScrollViews
//
//  Created by WeiWen on 16/3/18.
//  Copyright © 2016年 WeiWen. All rights reserved.
//

import UIKit

class ScrollViewContainer: UIView {

    @IBOutlet var scrollView: UIScrollView!
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, withEvent: event)
        if let theView = view {
            if theView == self {
                return scrollView
            }
            
        }
        
        return view
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
