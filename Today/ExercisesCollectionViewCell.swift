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
        fatalError("init(coder:) has not been implemented")
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
    }}
