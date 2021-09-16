//
//  ProgressLoadingView.swift
//  FundRanking
//
//  Created by Sattra on 9/13/21.
//

import UIKit
import Lottie

class ProgressLoadingView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet var animationView: AnimationView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadXib()
    }
    
    func loadXib(){
        Bundle.main.loadNibNamed("ProgressLoading",
                                 owner: self,
                                 options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func play(){
        let animation = Animation.named("57993-win-crown-animation")
        animationView.animation = animation
        animationView.animationSpeed = 1.5
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.play()
    }
    
    func stop(){
        animationView.stop()
    }

}
