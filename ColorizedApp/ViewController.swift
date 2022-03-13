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
        
        updateLabels(for: redCount, greenCount, blueCount)
        colorizeView()
    }

    @IBAction func rgbSlider(_ sender: UISlider) {
        colorizeView()
        switch sender {
        case redSlider:
            redCount.text = string(from: redSlider)
        case greenSlider:
            greenCount.text = string(from: greenSlider)
        default:
            blueCount.text = string(from: blueSlider)
        }
    }
    
    private func colorizeView() {
        coloredView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func updateLabels(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redCount:
                redCount.text = string(from: redSlider)
            case greenCount:
                greenCount.text = string(from: greenSlider)
            default:
                blueCount.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format:"%.2f", slider.value)
    }
}

