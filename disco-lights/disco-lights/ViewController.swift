//
//  ViewController.swift
//  disco-lights
//
//  Created by Pauli Sairanen on 6.11.2018.
//  Copyright © 2018 Pauli Sairanen. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
//---------- Channging color just once ----------
    @IBAction func changeColour(_ sender: Any)
    {
        self.view.backgroundColor = UIColor.clear
        var colors = [#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)]
        let random = Int.random(in: 0...7)
        self.view.backgroundColor = colors[random]
    }
//---------- Channging color over time ----------
    @IBAction func goSmoothWithColors(_ sender: Any)
    {
        self.view.backgroundColor = UIColor.clear //Reset background color for animations to work
        
        //Animation and its properties
        UIView.animate(withDuration: 2, delay: 0, options:
            [UIView.AnimationOptions.allowUserInteraction,
             UIView.AnimationOptions.repeat,
             UIView.AnimationOptions.curveLinear,
             UIView.AnimationOptions.autoreverse],animations:
            {
                //Setting background color as random for animation
                self.view.backgroundColor = randomColor()
                self.view.backgroundColor = randomColor()
                self.view.backgroundColor = randomColor()
                self.view.backgroundColor = randomColor()
            }, completion:nil )
        
        //Generating random colour
        func randomColor() -> UIColor
        {
            let randomRed:CGFloat = CGFloat(drand48())
            let randomGreen:CGFloat = CGFloat(drand48())
            let randomBlue:CGFloat = CGFloat(drand48())
            
            return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        }
    }
//---------- Channging color rapidly ----------
    @IBAction func goBatShitCrazyWithColors(_ sender: Any)
    {
        self.view.backgroundColor = UIColor.clear
        var colors = [#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)]
        var random: Int = 0
        
        background  //Execute in background thread
        {
            for _ in 1...200
            {
                random = Int.random(in: 0...7)
                self.main //Execute in main thread
                {
                    self.view.backgroundColor = colors[random]
                }
                usleep(50000)
            }
        }
    }
    
//__________ For background and foreground threading__________
    func background(work: @escaping () -> ())
    {
        DispatchQueue.global(qos: .userInitiated).async
        {
            work()
        }
    }
    
    func main(work: @escaping () -> ())
    {
        DispatchQueue.main.async
        {
            work()
        }
    }
    
    
    
}




