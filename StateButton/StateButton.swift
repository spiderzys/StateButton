//
//  StateButton.swift
//  StateButton
//
//  Created by Yangsheng Zou on 2019-11-05.
//  Copyright © 2019 Yangsheng. All rights reserved.
//


import UIKit

class StateButton: UIButton {
    
    struct ButtonState {
        let action: ()->Void
        let image: UIImage?
        let tintColor:UIColor?
        let info:Any?
        let title:String?
        init(action: @escaping ()->Void, title:String? = nil, image: UIImage? = nil ,tintColor:UIColor? = nil, info:Any? = nil) {
            self.action = action
            self.image = image
            self.tintColor = tintColor
            self.info = info
            self.title = title
        }
    }
    
    var stateChangeMinGap:Double = 1
    
    private var currentStateIndex:Int = 0
    
    @objc func nextState() {
        guard states.count > 0 else {return}
        self.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(Int(stateChangeMinGap * 1000)), execute: {
            self.isUserInteractionEnabled = true
        })
        currentStateIndex = (currentStateIndex + 1)%states.count
        activate(state: states[currentStateIndex])
        
    }
    
    
    private func activate(state:ButtonState, actionPerformed:Bool = true) {
      
        setImage( state.image?.withRenderingMode(state.tintColor != nil ? .alwaysTemplate: .alwaysOriginal), for: .normal)
        self.tintColor = state.tintColor
        self.setTitle(state.title, for: .normal)
        if actionPerformed {
            state.action()
        }
    }

    var states:[ButtonState] = [] {
        didSet {
            guard let firstState = states.first else {return}
            addTarget(self, action: #selector(nextState), for: .touchUpInside)
            activate(state: firstState, actionPerformed: false)
        }
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}





