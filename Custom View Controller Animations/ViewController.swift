//
//  ViewController.swift
//  AnimationStation
//
//  Created by Laurie Gray on 26/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   let cewlAnimation = CewlAnimation()
    
    @IBAction func loadVCInStyle(_ sender: Any) {
        let detailView = storyboard!.instantiateViewController(withIdentifier: "DetailView") as! DetailController
        detailView.transitioningDelegate = self
        present(detailView, animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return cewlAnimation
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}

