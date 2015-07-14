//
//  ExercisesCellCollectionViewCell.swift
//  Today
//
//  Created by Henrik Vendelbo on 04/07/2015.
//  Copyright © 2015 Right Here Inc. All rights reserved.
//

import UIKit
import QuartzCore

class ExercisesCollectionViewCell: UICollectionViewCell, UIWebViewDelegate {

    let httpTimeout:NSTimeInterval = 30

    var _title = ""
    var title: String {
        get { return _title }
        set {
            _title = newValue
            if (self.nameLabel != nil) {
                self.nameLabel!.text = newValue
            }
        }
    }
    var color = UIColor.whiteColor()
    
    var _progress:Float = 0.0
    var progress:Float {
        get { return _progress }
        set {
            _progress = newValue
            if (self.taskProgress != nil) {
                self.taskProgress!.progress = _progress
            }
        }
    }
    
    @IBOutlet var webView: UIWebView? = nil
    @IBOutlet var snapshotImageView: UIImageView? = nil
    @IBOutlet var nameLabel : UILabel? = nil
    @IBOutlet var taskProgress: UIProgressView? = nil
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundView = UIView(frame: CGRectMake(0,0,100,100))
        //TODO rect full size constraints
        self.selectedBackgroundView = UIView(frame: CGRectMake(0,0,100,100))
        //TODO rect full size constraints
        
        self.backgroundView!.backgroundColor = UIColor.clearColor() //self.color
//        self.backgroundView.layer.cornerRadius = CGFloat(self.cardCornerRadius)
        //                self.backgroundView.layer.borderWidth = 1.0
        //                self.backgroundView.layer.borderColor = UIColor.blackColor().CGColor
        
        self.selectedBackgroundView!.backgroundColor = UIColor.clearColor() //self.color
//        self.selectedBackgroundView.layer.cornerRadius = CGFloat(self.cardCornerRadius)
        //        self.selectedBackgroundView.layer.borderWidth = 1.0
        //        self.selectedBackgroundView.layer.borderColor = UIColor.blackColor().CGColor
        
//        self.backgroundView.clipsToBounds = false
//        self.backgroundView.layer.shadowColor = UIColor.grayColor().CGColor
//        self.backgroundView.layer.shadowOpacity = Float(0.7)
//        self.backgroundView.layer.shadowRadius = CGFloat(4.0)
//        self.backgroundView.layer.shadowOffset = CGSizeMake(CGFloat(0.0), CGFloat(-10.0))
//        self.backgroundView.layer.shadowPath = UIBezierPath(rect: self.backgroundView.bounds).CGPath
    }
    
    func setHTML(desc: ExerciseDescription) {
        /*
        var url:NSURL? = NSURL(string:"http://google.com")
        var request = NSURLRequest(URL: url, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: self.httpTimeout)
        self.webView.loadRequest(request)
        return
        */
        if (desc.url != nil) {
            let request = NSURLRequest(URL: desc.url!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: self.httpTimeout)
            self.webView!.loadRequest(request)
        } else if (desc.html != nil) {
            self.webView!.loadHTMLString(desc.html!, baseURL: nil)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.opaque = false
        self.backgroundColor = UIColor.clearColor()
        
        self.nameLabel!.text = self.title
        
//        self.webView.layer.cornerRadius = CGFloat(self.cardCornerRadius)
//        self.webView.clipsToBounds = true
//        self.snapshotImageView.layer.cornerRadius = CGFloat(self.cardCornerRadius)
//        self.snapshotImageView.clipsToBounds = true
        
        self.takeSnapshot()
    }
    
    func takeSnapshot() {
        UIGraphicsBeginImageContextWithOptions(self.snapshotImageView!.frame.size, true, 0.0) //TODO adjust it perhaps ?
        self.webView!.layer.renderInContext(UIGraphicsGetCurrentContext())
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.snapshotImageView!.image = image
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
    }
    
    //    func webView() {
    //
    //    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        
        super.applyLayoutAttributes(layoutAttributes)
        
        let cardAttributes = layoutAttributes as! ExercisesViewLayoutAttributes
        
        // update the background size to full height
        var bgFrame = self.backgroundView!.frame, bgBounds = self.backgroundView!.bounds
        bgFrame.size.height = layoutAttributes.size.height
        bgBounds.size.height = layoutAttributes.size.height
        self.backgroundView!.frame = bgFrame
        self.selectedBackgroundView!.frame = bgFrame
        //        self.backgroundView.bounds = bgBounds
        //        self.selectedBackgroundView.bounds = bgBounds
        
        //TODO skip if height/width unchanged
        let backgroundBounds = self.backgroundView!.bounds
//        backgroundBounds.size.height -= CGFloat(self.cardCornerRadius)
//        backgroundBounds.origin.y += CGFloat(self.cardCornerRadius)
        self.backgroundView!.layer.shadowPath = UIBezierPath(rect: backgroundBounds).CGPath
        self.selectedBackgroundView!.layer.shadowPath = UIBezierPath(rect: backgroundBounds).CGPath
        
        // showing webview or the snapshot
        self.webView!.hidden = !cardAttributes.foreground
        self.snapshotImageView!.hidden = cardAttributes.foreground
        //        println("ix=\(cardAttributes.indexPath.item) WebView hidden=\(self.webView.hidden), snapshot hidden=\(self.snapshotImageView.hidden), foreground = \(cardAttributes.foreground)")
        //TODO other snapshot bits
    }
    
    func setImagePath(name:String) {
        snapshotImageView?.image = UIImage(named: name) 
        //        self.imageView.setImage(image)
    }

    /*
    
    func setLabel(text: String) {
    self.nameLabel.text = text
    }
    */
    //    func setTitle(title: String) {
    //        self.title = title
    //        if self.nameLabel {
    //            self.nameLabel.text = title
    //        }
    //    }
    
    func setMainColor(color: UIColor) {
        self.color = color
        //TODO update backgroundView and selectedBackgroundView
    }
    
    /* TODO
    func setSelected(selected: Bool) {
    
    }
    */
}
