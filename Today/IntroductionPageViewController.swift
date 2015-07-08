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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
