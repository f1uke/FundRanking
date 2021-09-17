//
//  DialogErrorViewController.swift
//  FundRanking
//
//  Created by Sattra on 9/17/21.
//

import UIKit
import Lottie

class DialogErrorViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var errorMessage: UILabel!
    
    private var messageString: String?
    
    class func initial(message: String?) -> DialogErrorViewController {
        let dialog = Storyboards.components.storyboard.instantiateViewController(withIdentifier: Storyboards.components.dialogErrorVC) as! DialogErrorViewController
        
        dialog.messageString = message
        dialog.modalTransitionStyle = .crossDissolve
        dialog.modalPresentationStyle = .overFullScreen
        return dialog
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        play()
        delayDismiss()
        errorMessage.text = messageString
    }
    
    private func play() {
        let animation = Animation.named("4698-wrong-answer")
        animationView.animation = animation
        animationView.animationSpeed = 1.5
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .playOnce
        animationView.play()
    }
    
    private func delayDismiss() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismiss(animated: true, completion: nil)
        }
    }

}
