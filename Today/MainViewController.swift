//
//  MainViewController.swift
//  Today
//
//  Created by Henrik Vendelbo on 04/07/2015.
//  Copyright © 2015 Right Here Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak private var leftToolbar: UIToolbar?;
    @IBOutlet weak private var rightToolbar: UIToolbar?;

    // for now, consider matching with background image
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    /*
    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
//        leftToolbar!.setBackgroundImage(nil, forToolbarPosition: .Any, barMetrics: .Default)
        leftToolbar!.backgroundColor = UIColor.clearColor()
//        leftToolbar.setBackgroundColor(UIColor.clearColor())
//        leftToolbar.set(backgroundColor:UIColor.clearColor())
    }
    */
}
