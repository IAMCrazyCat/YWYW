//
//  ViewController.swift
//  YWYW
//
//  Created by Christian Liu on 2020/5/16.
//  Copyright © 2020 King. All rights reserved.
//

import UIKit


class HomepageViewController: UIViewController, UISearchBarDelegate  {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var startLessonButton: UIButton!

    @IBOutlet weak var DailyWordsPageControl: UIPageControl!
    @IBOutlet weak var DailyWordsCollectionView: UICollectionView!
    
    var imageArray = [UIImage(named: "dailyWord_1"),
    UIImage(named: "dailyWord_2"),
    UIImage(named: "dailyWord_3"),
    UIImage(named: "dailyWord_4")]
    var timer = Timer()
    var counter = 0
    let searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 400, height: 30))
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationBarStyle()
        searchBarStyle()
        buttonStyle()
        
        DailyWordsPageControl.numberOfPages = imageArray.count
        DailyWordsPageControl.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
       
        
        
    }
    
    func navigationBarStyle(){
        
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        
        //self.navigationController!.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40)
        
    
    }
    func searchBarStyle(){
          searchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func buttonStyle(){
        startLessonButton.layer.cornerRadius =  10
       
    }
    

    
    

    
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
      }
    
    @objc func changeImage() { // Change Images and page dots
        if counter < imageArray.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.DailyWordsCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            DailyWordsPageControl.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.DailyWordsCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            DailyWordsPageControl.currentPage = counter
            counter = 1
        }
        
    }
}

extension HomepageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    } // Load images to collection vxfiew
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Daily Words Cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
           
            vc.image = imageArray[indexPath.row]
        }
        return cell
    }
}

extension HomepageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = DailyWordsCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}



