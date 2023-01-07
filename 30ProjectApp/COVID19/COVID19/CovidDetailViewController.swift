//
//  CovidDetailViewController.swift
//  COVID19
//
//  Created by 우주형 on 2023/01/07.
//

import UIKit

class CovidDetailViewController: UITableViewController {
    
    @IBOutlet weak var newCaseCell: UITableViewCell!
    @IBOutlet weak var totalCaseCell: UITableViewCell!
    @IBOutlet weak var recoveredCell: UITableViewCell!
    @IBOutlet weak var deathCell: UITableViewCell!
    @IBOutlet weak var percentageCell: UITableViewCell!
    @IBOutlet weak var overseasInflowCell: UITableViewCell!
    @IBOutlet weak var regionalOutbreakCell: UITableViewCell!
    
    var covidModel: CovidModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        guard let covidModel = self.covidModel else { return }
        self.title = covidModel.countryName
        newCaseCell.detailTextLabel?.text = "\(covidModel.newCase)명"
        totalCaseCell.detailTextLabel?.text = "\(covidModel.totalCase)명"
        recoveredCell.detailTextLabel?.text = "\(covidModel.recovered)명"
        deathCell.detailTextLabel?.text = "\(covidModel.death)명"
        percentageCell.detailTextLabel?.text = "\(covidModel.percentage)%"
        overseasInflowCell.detailTextLabel?.text = "\(covidModel.newFcase)명"
        regionalOutbreakCell.detailTextLabel?.text = "\(covidModel.newCcase)명"
    }
    
}
