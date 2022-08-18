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
    @IBOutlet weak var minusAmountDisplay: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var totalClicks: Int = 0
    var plusAmount: Int = 1
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
            case 0:
            minusAmountDisplay.setTitle("-1", for: .normal)
            counterDisplay.setTitle("+1", for: .normal)
            plusAmount = 1
            case 1:
            minusAmountDisplay.setTitle("-2", for: .normal)
            counterDisplay.setTitle("+2", for: .normal)
            plusAmount = 2
            case 2:
            minusAmountDisplay.setTitle("-5", for: .normal)
            counterDisplay.setTitle("+5", for: .normal)
            plusAmount = 5
            case 3:
            minusAmountDisplay.setTitle("-10", for: .normal)
            counterDisplay.setTitle("+10", for: .normal)
            plusAmount = 10
            default:
                break
            }
    }
    
    
    @IBAction func clickerClickedPlusOne(_ sender: UIButton) {
        totalClicks = totalClicks + plusAmount
        updateUI()
        playSound(soundName: "click")
    }
    
    @IBAction func clickerClickedMinusOne(_ sender: UIButton) {
        totalClicks = totalClicks - plusAmount
        updateUI()
        playSound(soundName: "click")
    }
    
    @IBAction func resetCounter(_ sender: UIButton) {
        resetTotal()
    }
    
    // Updates total clicks.
    
    func updateUI () {
        self.counterDisplay.setTitle("\(totalClicks)", for: .normal)
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
    }
    }
    
}
