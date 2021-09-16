//
//  ViewController.swift
//  FundRanking
//
//  Created by Sattra on 9/13/21.
//

import UIKit
import SnapKit

class RankingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentView: UIView!
    @IBOutlet weak var dayBtn: UIButton!
    @IBOutlet weak var weekBtn: UIButton!
    @IBOutlet weak var monthBtn: UIButton!
    @IBOutlet weak var yearBtn: UIButton!
    @IBOutlet weak var highlightBtnBg: UICustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //change highLightBg position with animation
    //use snapKit to make it easy to change constraints
    private func switchSegment(selected: String) {
        switch selected {
        case "day":
            self.highlightBtnBg.snp.remakeConstraints { (make) in
                make.centerX.equalTo(self.dayBtn)
            }
        case "week":
            self.highlightBtnBg.snp.remakeConstraints { (make) in
                make.centerX.equalTo(self.weekBtn)
            }
        case "month":
            self.highlightBtnBg.snp.remakeConstraints { (make) in
                make.centerX.equalTo(self.monthBtn)
            }
        case "year":
            self.highlightBtnBg.snp.remakeConstraints { (make) in
                make.centerX.equalTo(self.yearBtn)
            }
        default:
            //"day"
            self.highlightBtnBg.snp.remakeConstraints { (make) in
                make.centerX.equalTo(self.dayBtn)
            }
        }
        
        UIView.animate(withDuration: 0.3) {
            self.segmentView.layoutIfNeeded()
        }
    }
    
    @IBAction func dayPressed(_ sender: Any) {
        switchSegment(selected: "day")
    }
    
    @IBAction func weekPressed(_ sender: Any) {
        switchSegment(selected: "week")
    }
    
    @IBAction func monthPressed(_ sender: Any) {
        switchSegment(selected: "month")
    }
    
    @IBAction func yearPressed(_ sender: Any) {
        switchSegment(selected: "year")
        AppUtils.presentLoading()
    }
}

extension RankingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: RankingCell.cellId) as! RankingCell
        
        return cell
    }
    
    
}

