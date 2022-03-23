//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Ildar Khabibullin on 21.03.2022.
//

import UIKit

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
        }
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "segueSettingsVC", sender: nil)
        
    }
    
}
