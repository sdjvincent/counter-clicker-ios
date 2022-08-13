//
//  ViewController.swift
//  CounterClickeriOS
//
//  Created by Simon Vincent on 13/08/2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var counterDisplay: UIButton!
    
    var totalClicks: Int = 0
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateUI () {
        self.counterDisplay.setTitle("\(totalClicks)", for: .normal)
    }

    @IBAction func clickerClickedPlusOne(_ sender: UIButton) {
        totalClicks = totalClicks + 1
        updateUI()
        playSound(soundName: "click")
    }
    
    @IBAction func clickerClickedMinusOne(_ sender: UIButton) {
        totalClicks = totalClicks - 1
        updateUI()
        playSound(soundName: "click")
    }
    
    @IBAction func clickerClickedPlusTen(_ sender: UIButton) {
        totalClicks = totalClicks + 10
        updateUI()
        playSound(soundName: "click")
    }
    
    @IBAction func clickerClickedMinusTen(_ sender: UIButton) {
        totalClicks = totalClicks - 10
        updateUI()
        playSound(soundName: "click")
    }
    
    @IBAction func resetCounter(_ sender: UIButton) {
        totalClicks = 0
        updateUI()
        playSound(soundName: "reset-click")
    }
    
    
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

