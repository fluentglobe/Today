//
//  ExercisesDataSource.swift
//  Today
//
//  Created by Henrik Vendelbo on 04/07/2015.
//  Copyright © 2015 Right Here Inc. All rights reserved.
//

import UIKit

let HTML_BEGIN = "<html><body>"
let HTML_END = "</body></html>"
let HTML_ONE_PLACE = "<p>Fluentbook keeps your language materials: exercises, conversations, and chapters in one place.</p>"
let HTML_SCAN_BARCODE = "<p>To get materials scan a barcode or ask your teacher to assign material to you.</p>"

class ExerciseDescription {
    var title:String = "Exercise"
    var progress:Float = 0.1
    
    var html:String? = HTML_BEGIN + HTML_ONE_PLACE + HTML_SCAN_BARCODE + HTML_END
    var url:NSURL? = nil
    var imageName = "Barbie"
    
    init() {
    }
    
    init(_ _name:String, _ _progress:Float) {
        self.title = _name
        self.progress = _progress
    }
    
    init(_ _name:String, _ _progress:Float, url:String) {
        self.title = _name
        self.progress = _progress
        self.url = NSURL(string:url)
        self.html = nil
    }
}

func exercisesDefs() -> NSMutableArray {
    let exercises:NSArray = [
        ExerciseDescription("Introduction", 0, url:"https://api.fluentglobe.com/zurich/book-intro.html"),
        ExerciseDescription("Day of the week", 0.1, url: "https://api.fluentglobe.com/book/exercise.html"),
        ExerciseDescription("Supermarket Counter",0.2, url: "https://api.fluentglobe.com/book/exercise.html"),
        ExerciseDescription("Numbers Bingo",0.3, url: "https://api.fluentglobe.com/book/exercise.html"),
        ExerciseDescription("Weekend Visit Story",0.4, url: "https://api.fluentglobe.com/book/exercise.html"),
        ExerciseDescription("Complete the Dialog",0.5, url: "https://api.fluentglobe.com/book/exercise.html"),
        ExerciseDescription("Speak the Pictures",0.6, url: "https://api.fluentglobe.com/book/exercise.html"),
    ]
    return NSMutableArray(array: exercises)
}


class ExercisesDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    lazy var exercises = exercisesDefs()
    
    
    func exercisesTodayCount() -> Int {
        //TODO based on datasource
        return exercises.count
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.exercises.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ExercisesCell", forIndexPath: indexPath) as UICollectionViewCell
        let desc = self.exercises[indexPath.item]
        
        if let exercise = cell as? ExercisesCollectionViewCell {
            exercise.initConstraints()
            if let edesc = desc as? ExerciseDescription {
                exercise.title = edesc.title + " (\(indexPath.item))"
                exercise.progress = edesc.progress
                exercise.color = UIColor.whiteColor()
                exercise.setHTML(edesc)
                exercise.setImagePath(edesc.imageName)
            }
        }
        
        return cell
    }
}
