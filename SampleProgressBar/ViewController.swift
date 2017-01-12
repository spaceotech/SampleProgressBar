//
//  ViewController.swift
//  SampleProgressBar
//
//  Created by Hitesh on 1/12/17.
//  Copyright © 2017 spaceo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblPercentage: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var lblValue: UILabel!
    
    var time : Float = 0.0
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnStart.layer.cornerRadius = btnStart.frame.size.height/2
        btnStart.layer.masksToBounds = true
    }
    
    //MARK: Action for update progressbar with timer
    @IBAction func actionStart() {
        
        //Invalid timer if it is valid
        if (timer?.valid == true) {
            timer?.invalidate()
        }
        
        time = 0.0
        progressBar.setProgress(0.0, animated: true)
        lblPercentage.text = "\(progressBar.progress*100)%"+" of 10"
        lblValue.text = "\(time)"+" out of 10"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector:#selector(ViewController.setProgress), userInfo: nil, repeats: true)
        
    }
    
    //MARK: Show progress
    func setProgress() {
        time += 1.0
        progressBar.setProgress(time/10, animated: true)
        
        lblPercentage.text = "\(progressBar.progress*100)%"+" of 10"
        lblValue.text = "\(time)"+" out of 10"
        
        if time >= 10 {
            timer!.invalidate()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

