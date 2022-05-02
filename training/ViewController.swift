//
//  ViewController.swift
//  training
//
//  Created by Seyran Saakyan on 02.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    enum Rotation{
        case down
        case right
        case up
        case left
    }
    
    var direction = Rotation.down
    let saveZone: CGFloat = 8
    @IBOutlet weak var placeToMove: UIView!
    @IBOutlet weak var roundToMove: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundToMove.layer.cornerRadius = roundToMove.frame.width / 2
        
    }

    @IBAction func startButtonPressed(_ sender: Any) {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            self.move()
        }
        timer.fire()
    }
    
    func move(){
        switch direction{
        case .down:
            roundToMove.frame.origin.y += placeToMove.frame.height - (roundToMove.frame.height + saveZone*2)
            direction = .right
        case .right:
            roundToMove.frame.origin.x += placeToMove.frame.width - (roundToMove.frame.width + saveZone*2)
            direction = .up
        case .up:
            roundToMove.frame.origin.y -= placeToMove.frame.height - (roundToMove.frame.height + saveZone*2)
            direction = .left
        case .left:
            roundToMove.frame.origin.x -= placeToMove.frame.width - (roundToMove.frame.width + saveZone*2)
            direction = .down
        }
        
    }
    
}

