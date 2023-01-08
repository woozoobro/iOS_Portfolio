//
//  CardListViewController.swift
//  CardRecommendList
//
//  Created by 우주형 on 2023/01/08.
//

import UIKit

class CardListViewController: UITableViewController {

    var creditCardList: [CreditCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UITableView Cell Register
        let nibName = UINib(nibName: "CardListCell", bundle: nil)
        tableView.register(nibName,forCellReuseIdentifier: "CardListCell")
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditCardList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardListCell", for: indexPath) as? CardListCell else { return UITableViewCell() }
        cell.configure(creditCardList[indexPath.row])
        return cell
    }
   
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
