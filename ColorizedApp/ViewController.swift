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
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
         
    var backgroundColorOfView: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        coloredView.layer.cornerRadius = 10
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        coloredView.backgroundColor = backgroundColorOfView
        //return RGB float value of components
        var redColor: CGFloat = 0, greenColor: CGFloat = 0, blueColor: CGFloat = 0, alpha: CGFloat = 0
        backgroundColorOfView.getRed(&redColor, green: &greenColor, blue: &blueColor, alpha: &alpha)
        
        redSlider.value = Float(redColor)
        greenSlider.value = Float(greenColor)
        blueSlider.value = Float(blueColor)
        
        updateLabels(for: redCount, greenCount, blueCount)
        self.addDoneButton()

    }

    @IBAction func rgbSlider(_ sender: UISlider) {
        colorizeView()
        switch sender {
        case redSlider:
            redCount.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case greenSlider:
            greenCount.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        default:
            blueCount.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonTapped() {
        delegate.setNewColor(redVC: redSlider.value, greenVC: greenSlider.value, blueVC: blueSlider.value)
        dismiss(animated: true)
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
                redTextField.text = string(from: redSlider)
            case greenCount:
                greenCount.text = string(from: greenSlider)
                greenTextField.text = string(from: greenSlider)
            default:
                blueCount.text = string(from: blueSlider)
                blueTextField.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format:"%.2f", slider.value)
    }
}

extension ViewController {
    func addDoneButton() {
        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                               y: 0.0,
                                               width: UIScreen.main.bounds.size.width,
                                               height: 44.0))//1
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2
        let DoneButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: #selector(tapDone))//3
        toolBar.setItems([flexibleSpace, DoneButton], animated: false)
        redTextField.inputAccessoryView = toolBar
        greenTextField.inputAccessoryView = toolBar
        blueTextField.inputAccessoryView = toolBar
    }
    
    @objc func tapDone() {
        self.view.endEditing(true)

        delegate.setNewColor(redVC: redSlider.value, greenVC: greenSlider.value, blueVC: blueSlider.value)
        view.endEditing(true)
       
        dismiss(animated: true)
    }
}

//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }
        
        if textField == redTextField {
            redSlider.value = numberValue
            redCount.text = String(format:"%.2f", numberValue)
        } else if textField == greenTextField {
            greenSlider.value = numberValue
            greenCount.text = String(format:"%.2f", numberValue)
        } else {
            blueSlider.value = numberValue
            blueCount.text = String(format:"%.2f", numberValue)
        }
    }
}
