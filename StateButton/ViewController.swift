//
//  ViewController.swift
//  StateButton
//
//  Created by Conan Chen on 2019-07-16.
//  Copyright © 2019 Yangsheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var toggleButton: StateButton!
    @IBOutlet weak var rotationButton: StateButton!
    @IBOutlet weak var displayModeButton: StateButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        toggleButton.states = [
            .init(action: { [weak self] in
                
                }, image: UIImage(named: "icon1")),
            .init(action: { [weak self] in
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() +  1, execute: {
                    // after 1s back to initial state
                    self?.toggleButton.nextState()
                    
                })
                }, image: UIImage(named: "icon1"), tintColor: UIColor.blue )
        ]
        
        rotationButton.states = [
            .init(action: { [weak self] in
              //
                }, image: UIImage(named: "map_revolution_normal")),
            .init(action: { [weak self] in
                //
                }, image: UIImage(named: "map_revolution_selected") )
        ]
        
        
        displayModeButton.states = [
            .init(action: { [weak self] in
                //
                }, title: "2D"),
            .init(action: { [weak self] in
                //
                }, title: "3D"),
            .init(action: { [weak self] in
                //
                }, image: UIImage(named: "map_satellite")),
        ]
        
    }
    
    
}




