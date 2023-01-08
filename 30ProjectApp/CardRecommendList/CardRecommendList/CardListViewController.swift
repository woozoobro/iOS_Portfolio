//
//  CardListViewController.swift
//  CardRecommendList
//
//  Created by 우주형 on 2023/01/08.
//

import UIKit
import FirebaseDatabase

class CardListViewController: UITableViewController {
    
    var ref: DatabaseReference! //Firebase Realtime Database

    var creditCardList: [CreditCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UITableView Cell Register
        let nibName = UINib(nibName: "CardListCell", bundle: nil)
        tableView.register(nibName,forCellReuseIdentifier: "CardListCell")
        
        ref = Database.database().reference()
        ref.observe(.value) { snapshot in
            guard let value = snapshot.value as? [String: [String: Any]] else { return }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: value)
                let cardData = try JSONDecoder().decode([String: CreditCard].self, from: jsonData)
                let cardList = Array(cardData.values)
                self.creditCardList = cardList.sorted { $0.rank < $1.rank }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print("Error JSON parsing \(error.localizedDescription)")
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditCardList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardListCell", for: indexPath) as? CardListCell else { return UITableViewCell() }
        cell.configure(creditCardList[indexPath.row])
        return cell
    }
   
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 120
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //상세화면 전달
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let detailVC = sb.instantiateViewController(withIdentifier: "CardDetailViewController") as? CardDetailViewController else { return }
        detailVC.promotionDetail = creditCardList[indexPath.row].promotionDetail
        show(detailVC, sender: nil)
        
    }
}
