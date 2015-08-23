//
//  ToUserDetailAnimationController.swift
//  GitHubApp
//
//  Created by Mark Lin on 8/23/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class ToUserDetailAnimationController: NSObject {
   
}


//Mark ToUserDetailAnimationController animationController
extension ToUserDetailAnimationController: UIViewControllerAnimatedTransitioning{
  
  
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
    return 0.4
  }

  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    if let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as? UserSearchViewController,
      toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)as? DetailedUserViewController{
        let containterView = transitionContext.containerView()
        
        toVC.view.alpha = 0
        containterView.addSubview(toVC.view)
        
        let indexPath = fromVC.userCollection.indexPathsForSelectedItems().first as! NSIndexPath
        let userCell = fromVC.userCollection.cellForItemAtIndexPath(indexPath)as! UserCollectionViewCell
        let snapShot = userCell.image.snapshotViewAfterScreenUpdates(false)
        
        snapShot.frame = containterView.convertRect(userCell.image.frame, fromCoordinateSpace: userCell.image.superview!)
        println("snapshot\(snapShot.frame)")
        
        containterView.addSubview(snapShot)
        userCell.hidden = true
        
        toVC.image.hidden = true
        toVC.userName.hidden = true
        
        let destinationFrame = toVC.image.frame
        println("destination \(destinationFrame)")
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
          snapShot.frame = destinationFrame
          println(destinationFrame)
          toVC.view.alpha = 1
          toVC.userName.alpha = 1
        }, completion: { (finished) -> Void in
          userCell.hidden = false
          toVC.image.hidden = false
          toVC.userName.hidden = false
          snapShot.removeFromSuperview()
          if finished{
            transitionContext.completeTransition(finished)
          }else{
            transitionContext.completeTransition(finished)
          }
        })
}
}
}