//
//  PlusTwoViewController.swift
//  CounterClickeriOS
//
//  Created by Simon Vincent on 13/08/2022.
//

import UIKit
import AVFoundation

class PlusTwoViewController: UIViewController {
    
    @IBOutlet weak var counterDisplayTwo: UIButton!
    
    var totalClicks: Int = 0
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Swipe gestures for moving between view controllers.
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipeFunc(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            print("Swiped Right")
            performSegue(withIdentifier: "right", sender: self)
        }
        else if gesture.direction == .left {
            print("Swiped Left")
            performSegue(withIdentifier: "left", sender: self)
    }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "right" {
            if let destination = segue.destination as? ViewController {
                destination.totalClicks = self.totalClicks
                }
                }
         if segue.identifier == "left" {
            if let destination = segue.destination as? ViewController {
                destination.totalClicks = self.totalClicks
            }
            }
    }
    
    
    @IBAction func clickerClickerPlusTwo(_ sender: UIButton) {
        totalClicks = totalClicks + 2
        updateUI()
        playSound(soundName: "click")
    }
    
    @IBAction func clickerClickedMinusTwo(_ sender: UIButton) {
        totalClicks = totalClicks - 2
        updateUI()
        playSound(soundName: "click")
    }
    
    @IBAction func resetTotalTwo(_ sender: UIButton) {
        resetTotal()
    }
    
    // Updates total clicks.
    
    func updateUI () {
        self.counterDisplayTwo.setTitle("\(totalClicks)", for: .normal)
    }

    // Reset total clicks.
    
    func resetTotal() {
        totalClicks = 0
        updateUI()
        playSound(soundName: "reset-click")
    }
    
    // Play sound.
    
    func playSound(soundName : String) {

                let path = Bundle.main.path(forResource: soundName, ofType: ".mp3")!
                let url = URL(fileURLWithPath: path)

                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player.play()
                } catch {
                    //couldn't load file :(
}
    }
    

}
