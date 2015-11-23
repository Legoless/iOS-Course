//
//  ViewController.swift
//  Photos
//
//  Created by Dal Rupnik on 18/11/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    var images : [String] {
        var allImages = [String]()
        
        for var i = 1; i <= 23; i++ {
            allImages.append(String(i))
        }
        
        return allImages
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! ImageCell
        cell.backgroundColor = UIColor.blackColor()
        cell.imageView.image = UIImage(named: images[indexPath.item])
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPath = collectionView?.indexPathForCell(sender as! UICollectionViewCell)
        
        if let destinationVC = segue.destinationViewController as? DetailViewController, indexPath = indexPath {
            destinationVC.image = UIImage(named: images[indexPath.item])
        }
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
        if let image = UIImage(named: images[indexPath.item]) {
            var size = image.size
            
            size.width /= 8.0
            size.height /= 8.0
            
            return size
        }
        
        return CGSize(width: 100, height: 100)
    }
}
