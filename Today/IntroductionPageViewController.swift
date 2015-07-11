//
//  IntroductionViewController.swift
//  Today
//
//  Created by Henrik Vendelbo on 08/07/2015.
//  Copyright © 2015 Right Here Inc. All rights reserved.
//

import UIKit

class IntroductionPageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        self.navigationController!.navigationBar.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        var controlsHeight:CGFloat = 40.0

        for subview in self.view.subviews {
            if subview is UIPageControl {
                controlsHeight = subview.frame.size.height
                self.view.bringSubviewToFront(subview)
            } else if let scrollview = subview as? UIScrollView {
                scrollview.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
                subview.frame = self.view.bounds
            }
        }
        //        pageViewController!.view.frame = CGRectMake(0, 0, pageViewController!.view.frame.size.width, pageViewController!.view.frame.size.height + controlsHeight)

        super.viewDidLayoutSubviews()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //TODO ken burns panning on active page image
    // http://stackoverflow.com/questions/5125862/ios-ken-burns-animation-implementation-requires-unexpected-parameters
    /*
    - (void)one {
    image.frame = // some frame that zooms in on the image;
    image.center = // tip of the nose
    
    [self performSelector:@selector(two) withObject:nil afterDelay:0];
    }
    
    - (void)two {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    image.frame = // original frame
    image.center = // original centerpoint
    
    [UIView commitAnimations];
    }
    */
}
