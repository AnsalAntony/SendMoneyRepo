//
//  ViewController.swift
//  SendMoney
//
//  Created by Ansal Antony on 26/06/20.
//  Copyright © 2020 Ansal Antony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pagerView: FSPagerView!
    @IBOutlet weak var collectionViewSetTo: UICollectionView!
    @IBOutlet weak var imageViewProfile: UIImageView!
    @IBOutlet weak var tableViewTransaction: UITableView!
     var transaction = [[String:String]]()
    let cards = ["card-2","card-3","card-4","card-5","card-6"]
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transactionArray()
        self.lodPagerCell()
        self.roundedImageView()
        self.loadCollectionViewCells()
        self.loadTableViewCell()
    }
    
    func roundedImageView(){
        self.imageViewProfile.layer.masksToBounds = false
              self.imageViewProfile.layer.cornerRadius =  self.imageViewProfile.frame.height/2
              self.imageViewProfile.clipsToBounds = true
    }
    
    func lodPagerCell(){
        self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
               self.pagerView.transformer = FSPagerViewTransformer(type: .linear)
              
               let transform = CGAffineTransform(scaleX: 0.6, y: 0.75)
               self.pagerView.itemSize = self.pagerView.frame.size.applying(transform)
               self.pagerView.decelerationDistance = FSPagerView.automaticDistance
               self.pagerView.itemSize = CGSize(width: 300, height: 210)
        
               
    }
    func loadCollectionViewCells(){
        self.collectionViewSetTo.register(UINib(nibName: "SentToCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SentToCollectionViewCell")
                self.collectionViewSetTo.register(UINib(nibName: "SendMoneyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SendMoneyCollectionViewCell")
    }
    func loadTableViewCell(){
        self.tableViewHeight.constant = CGFloat(Double(self.transaction.count) * 65)
        self.tableViewTransaction.register(UINib(nibName: "TransactionTableViewCell", bundle: nil), forCellReuseIdentifier: "TransactionTableViewCell")
           self.tableViewTransaction.estimatedRowHeight = 100
    }
    
    func transactionArray(){
        self.transaction.append(["name": "Janko", "bank": "To Paypal", "profile": "profilePic" ])
         self.transaction.append(["name": "Jack", "bank": "To Paytm", "profile": "transactionprofileimage1" ])
         self.transaction.append(["name": "Daved Kotur", "bank": "To phone Pay", "profile": "transactionprofileimage2" ])
         self.transaction.append(["name": "Modi", "bank": "To GooflePay", "profile": "transactionprofileimage3" ])
         self.transaction.append(["name": "Amith", "bank": "To Amazoon Pay", "profile": "transactionprofileimage4" ])
         self.transaction.append(["name": "Rahul", "bank": "To Paypal", "profile": "transactionprofileimage5" ])
         self.transaction.append(["name": "Sasi Tharurur", "bank": "To Paytm", "profile": "transactionprofileimage6" ])
         self.transaction.append(["name": "Jyalalitha", "bank": "To GooflePay", "profile": "transactionprofileimage7" ])
         self.transaction.append(["name": "Kuri K M", "bank": "To Amazoon Pay", "profile": "transactionprofileimage8" ])
    }
    
    
    @IBAction func vireAllTransaction(_ sender: Any) {
        
        
    }
    
    @IBAction func viewAllSetTo(_ sender: Any) {
        
    }
    
}
extension ViewController:FSPagerViewDataSource,FSPagerViewDelegate{
    // MARK:- FSPagerViewDataSource
      
      public func numberOfItems(in pagerView: FSPagerView) -> Int {
       return self.cards.count
      }
      
      public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
          let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
          cell.imageView?.image = UIImage(named: self.cards[index])
          cell.imageView?.contentMode = .scaleAspectFill
          cell.imageView?.layer.cornerRadius = 15
          cell.imageView?.clipsToBounds = true
          return cell
      }
      
      func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
          pagerView.deselectItem(at: index, animated: true)
          pagerView.scrollToItem(at: index, animated: true)
      }
 
    
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    // MARK: - UICollectionViewDataSource
  
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.transaction.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 150, height: 170);
     
       }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if(indexPath.item == 0){
                      let SendMoneyCell : SendMoneyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SendMoneyCollectionViewCell", for: indexPath) as! SendMoneyCollectionViewCell
                           return SendMoneyCell
                      
                  }else{
                      let Cell : SentToCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentToCollectionViewCell", for: indexPath) as! SentToCollectionViewCell
                           let name = self.transaction[indexPath.item] as Dictionary
                                      Cell.labelName.text = name["name"]
                                      Cell.imageViewSentTo.image = UIImage(named: name["profile"]!)
                           return Cell
                
            }
            
        
       }
    
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//     let storeVC = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier:"StoreListViewController") as! StoreListViewController
//      storeVC.latValue = self.latitudeVlaue
//      storeVC.lonVlaue = self.longitudeVlaue
//     self.present(storeVC, animated: true, completion: nil)
       }
    
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
        // MARK: Table view Data source
           func numberOfSections(in tableView: UITableView) -> Int {
               return 1
           }
           
           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               
            return self.transaction.count
            
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
               let Cell = self.tableViewTransaction.dequeueReusableCell(withIdentifier: "TransactionTableViewCell", for: indexPath) as! TransactionTableViewCell
            let name = self.transaction[indexPath.row] as Dictionary
            Cell.labelName.text = name["name"]
             Cell.labelBank.text = name["bank"]
            Cell.imageViewProfile.image = UIImage(named: name["profile"]!)
               return Cell
           }
           
           func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               return UITableView.automaticDimension
               //return 220
           }
           
           func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
           }
}
