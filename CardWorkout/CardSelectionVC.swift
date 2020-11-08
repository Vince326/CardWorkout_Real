//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Vincent Hunter on 10/29/20.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var cardImgView: UIImageView!
    
    var timer : Timer!
    var cards : [UIImage] = CardDeck.allValues

    
    @IBOutlet var buttons: [UIButton]!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        for button in buttons {
            button.layer.cornerRadius = 8
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        cardImgView.image = cards.randomElement() ?? UIImage(named: "AS")
    }

    @IBAction func stopBtnPressed(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartBtnTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
    
    
    
}
