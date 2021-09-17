//
//  AppUtils.swift
//  FundRanking
//
//  Created by Sattra on 9/16/21.
//

import UIKit

class AppUtils {
    
    class func presentLoading(){
        if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            let tag = 0xff
            if let progressLoading = window.viewWithTag(tag)  as? ProgressLoadingView{
                UIView.animate(withDuration: 0.3, animations: {
                    progressLoading.alpha = 1
                }, completion: { isSuccess in
                    progressLoading.play()
                })
            }else {
                let progressLoading = ProgressLoadingView(frame: CGRect(x: 0, y: 0, width: window.frame.width, height: window.frame.height))
                progressLoading.tag = tag
                window.addSubview(progressLoading)
                progressLoading.play()
                UIView.animate(withDuration: 0.2, animations: {
                    progressLoading.alpha = 1
                })
            }
        }
    }
    
    class func dismissLoading(onCompletion completion: (() -> Void)? = nil){
        if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }),
           let progressLoading = window.viewWithTag(0xff) as? ProgressLoadingView, progressLoading.alpha == 1 {
            progressLoading.stop()
            UIView.animate(withDuration: 0.2, animations: {
                progressLoading.alpha = 0
            }, completion: { isSuccess in
                completion?()
            })
            
        }
    }
    
    class func dateToString(date: Date, pattern: PatternDateFormatter = .timestamp, locale: Locale = LocaleDateTime.en) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormat = pattern.rawValue
        return dateFormatter.string(from: date)
    }
    
    class func stringToDate(dateString: String, pattern: PatternDateFormatter = .timestamp, locale: Locale = LocaleDateTime.en) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormat = pattern.rawValue
        return dateFormatter.date(from: dateString)
    }
    
}
