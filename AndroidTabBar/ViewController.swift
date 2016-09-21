//
//  ViewController.swift
//  AndroidTabBar
//
//  Created by alfian on 20/09/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var tabItem: [ UIViewController ] = [FirstViewController(), SecondViewController(), ThirdViewController()]
    
    init() {
        super.init(nibName: "ViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.registerNibs()
        self.addChildsViewController()
        
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    private func addChildsViewController() {
        for vc in self.tabItem {
            self.addChildViewController(vc)
            vc.didMoveToParentViewController(self)
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    private func registerNibs() {
        self.collectionView.registerNib(UINib(nibName: "BaseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "baseCell")
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("baseCell", forIndexPath: indexPath) as! BaseCollectionViewCell
            cell.addSubview(self.tabItem[indexPath.section].view)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
    }
}