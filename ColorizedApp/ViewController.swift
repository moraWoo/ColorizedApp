//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Ildar Khabibullin on 14.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redCount: UILabel!
    @IBOutlet var greenCount: UILabel!
    @IBOutlet var blueCount: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 10
    }

    @IBAction func moveRedSlider(_ sender: UISlider) {
        
    }
    @IBAction func moveGreenSlider(_ sender: UISlider) {
        
    }
    @IBAction func moveBlueSlider(_ sender: UISlider) {
        
    }
}

