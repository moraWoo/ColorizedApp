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

    private var red: CGFloat = 0
    private var green: CGFloat = 0
    private var blue: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 10
        
        redCount.text = String(format:"%.2f", redSlider.value)
        greenCount.text = String(format:"%.2f", greenSlider.value)
        blueCount.text = String(format:"%.2f", blueSlider.value)
         
        colorizeView()
    }

    @IBAction func moveRedSlider() {
        redCount.text = String(format:"%.2f", redSlider.value)
        red = CGFloat(redSlider.value)
        colorizeView()
    }
    @IBAction func moveGreenSlider() {
        greenCount.text = String(format:"%.2f", greenSlider.value)
        green = CGFloat(greenSlider.value)
        colorizeView()
    }
    @IBAction func moveBlueSlider() {
        blueCount.text = String(format:"%.2f", blueSlider.value)
        blue = CGFloat(blueSlider.value)
        colorizeView()
    }
    
    private func colorizeView() {
        coloredView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
}

