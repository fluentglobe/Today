//
//  IntroductionDataController.swift
//  Today
//
//  Created by Henrik Vendelbo on 08/07/2015.
//  Copyright © 2015 Right Here Inc. All rights reserved.
//

import UIKit

class IntroductionDataController: UINavigationController, UIPageViewControllerDataSource {

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.translucent = true
        navigationBar.hidden = true
        navigationBar.backgroundColor = UIColor.clearColor()
        
//        createPageViewController()
        setupPageControl()
    }
    
    override func viewDidLayoutSubviews() {
        for subview in self.view.subviews {
            if subview is UIPageControl {
//                controlsHeight = subview.frame.size.height
                self.view.bringSubviewToFront(subview)
            } else if let scrollview = subview as? UIScrollView {
                scrollview.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
                subview.frame = self.view.bounds
            }
        }

    }
    
    /*
    private func createPageViewController() {
        if let firstController = viewControllers[0] {
            let pageController = firstController as! UIPageViewController
            
            if contentImages.count > 0 {
                let firstController = getItemController(0)!
                let startingViewControllers: NSArray = [firstController]
                pageController.setViewControllers(startingViewControllers as! [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
            }
            
//            self.view.addSubview(pageViewController!.view)
        }
    }
    */
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        appearance.backgroundColor = UIColor.clearColor()
        
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! IndividualPageViewController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex-1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! IndividualPageViewController
        
        if itemController.itemIndex+1 < contentImages.count {
            return getItemController(itemController.itemIndex+1)
        }
        
        return nil
    }
    
    struct ItemDesc {
        var image : String;
        var line1 : String;
        
        init(image i: String,line1 one:String) {
            image = i
            line1 = one
        }
    }
    
    private func getItemController(itemIndex: Int) -> IndividualPageViewController? {
        
        if itemIndex < contentImages.count {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("IndividualController") as! IndividualPageViewController
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = contentImages[itemIndex].image
            pageItemController.line1 = contentImages[itemIndex].line1
            return pageItemController
        }
        
        return nil
    }
    
    // MARK: - Variables
    
    // Initialize it right away here
    private let contentImages = [
        ItemDesc(image:"Umzug.png",line1:"Learn the Local language one hour every day"),
        ItemDesc(image:"Barbie.png",line1:"Interactive exercises make the phrases you learn stick"),
        ItemDesc(image:"Bergzug.png",line1:"Lessons are tailored to your progress")
    ];
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
    
    // MARK: - Page Indicator
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return contentImages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    // other
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
