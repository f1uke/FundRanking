//
//  ViewController.swift
//  FundRanking
//
//  Created by Sattra on 9/13/21.
//

import UIKit
import SnapKit
import Lottie
import RxCocoa
import RxSwift

class RankingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchEdt: UITextField!
    @IBOutlet weak var segmentView: UIView!
    @IBOutlet weak var dayBtn: UIButton!
    @IBOutlet weak var weekBtn: UIButton!
    @IBOutlet weak var monthBtn: UIButton!
    @IBOutlet weak var yearBtn: UIButton!
    @IBOutlet weak var highlightBtnBg: UICustomView!
    @IBOutlet weak var logoLottie: AnimationView!
    @IBOutlet weak var notFoundLable: UILabel!
    
    lazy var viewModel: RankingViewModel = {
        return RankingViewModel(onErrorResponse: self.onErrorResponse,
                                onSuccess: self.onSuccess)
    }()
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        playAnimation()
        setupTableView()
    }
    
    private func setupTableView() {
        viewModel.tempFundInfos
            .bind(to: tableView.rx.items) { (tableView, index, element) in
                let cell = self.tableView.dequeueReusableCell(withIdentifier: RankingCell.cellId) as! RankingCell
                cell.setupView(fundInfo: element)
                return cell
            }.disposed(by: disposeBag)
    }
    
    private func setupView() {
        dayPressed(nil)
        
        searchEdt.rx.text.orEmpty.subscribe(onNext: { query in
            if !query.isEmpty {
                let filttered = self.viewModel.fundInfos?.filter({
                    $0.thailandFundCode!.uppercased().contains(query.uppercased())
                })
                self.viewModel.tempFundInfos.onNext(filttered!)
            }else {
                self.viewModel.tempFundInfos.onNext(self.viewModel.fundInfos ?? [])
            }
            
        }).disposed(by: disposeBag)
    }
    
    func playAnimation() {
        let animation = Animation.named("21192-premium-gold")
        logoLottie.animation = animation
        logoLottie.animationSpeed = 1.5
        logoLottie.contentMode = .scaleAspectFill
        logoLottie.loopMode = .loop
        logoLottie.play()
    }
    
    //present error dialog when service error
    private func onErrorResponse(_ message: String) {
        AppUtils.dismissLoading()
        let errorDialog = DialogErrorViewController.initial(message: message)
        self.present(errorDialog, animated: true)
    }
    
    private func onSuccess() {
        AppUtils.dismissLoading()
    }
    
    //change highLightBg position with animation
    //use snapKit to make it easy to change constraints
    private func switchSegment(selected: String) {
        clearSearchEdt()
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
    
    private func clearSearchEdt() {
        searchEdt.text = nil
        view.endEditing(true)
    }
    
    @IBAction func dayPressed(_ sender: Any?) {
        switchSegment(selected: "day")
        AppUtils.presentLoading()
        viewModel.getFundRankingDay()
    }
    
    @IBAction func weekPressed(_ sender: Any?) {
        switchSegment(selected: "week")
        AppUtils.presentLoading()
        viewModel.getFundRankingWeek()
    }
    
    @IBAction func monthPressed(_ sender: Any?) {
        switchSegment(selected: "month")
        AppUtils.presentLoading()
        viewModel.getFundRankingMonth()
    }
    
    @IBAction func yearPressed(_ sender: Any?) {
        switchSegment(selected: "year")
        AppUtils.presentLoading()
        viewModel.getFundRankingYear()
    }
}
