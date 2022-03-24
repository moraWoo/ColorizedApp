//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Ildar Khabibullin on 21.03.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(redVC: Float, greenVC: Float, blueVC: Float)
}

class MainViewController: UIViewController {

    private var backgroundColorOfView: UIColor!
    private var bColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? ViewController else { return }

        bColor = view.backgroundColor
        settingsVC.backgroundColorOfView = bColor
        settingsVC.delegate = self
        }
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "segueSettingsVC", sender: nil)
        
    }
    
}

//MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setNewColor(redVC: Float, greenVC: Float, blueVC: Float) {
        view.backgroundColor = UIColor(
            red: CGFloat(redVC),
            green: CGFloat(greenVC),
            blue: CGFloat(blueVC),
            alpha: 1
        )
    }
}
