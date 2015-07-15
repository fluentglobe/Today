//
//  MainViewController.swift
//  Today
//
//  Created by Henrik Vendelbo on 04/07/2015.
//  Copyright © 2015 Right Here Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak private var leftToolbar: UIToolbar?
    @IBOutlet weak private var rightToolbar: UIToolbar?
    
    var dataSource = ExercisesDataSource()

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initConstraints() // What about multiple loads
    }
    
    func initConstraints() {
        let collectionView = childViewControllers.last!.view
        
        view.addConstraints([
            NSLayoutConstraint(item: view, attribute: .Leading, relatedBy: .Equal, toItem: collectionView, attribute: .Leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: view, attribute: .Trailing, relatedBy: .Equal, toItem: collectionView, attribute: .Trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: view, attribute: .Top, relatedBy: .Equal, toItem: collectionView, attribute: .Top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: view, attribute: .Bottom, relatedBy: .Equal, toItem: collectionView, attribute: .Bottom, multiplier: 1, constant: 0)
            ])
    }
}
