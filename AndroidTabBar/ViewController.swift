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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
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
        
        if self.navigationController?.navigationBar.hidden == true {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
        let logo = UIImageView(image: R.image.goDevLogo)
            logo.frame = CGRectMake(0, 0, 30, 30)
            logo.contentMode = .ScaleAspectFit
        self.navigationItem.titleView = logo
        
        let titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, forState: .Selected)
        self.segmentedControl.addTarget(self, action: #selector(self.segementedAction(_:)), forControlEvents: .ValueChanged)
        
//        self.addShadowToBar()
    }
    
    @objc private func segementedAction(sender: UISegmentedControl) {
        self.collectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: 0, inSection: sender.selectedSegmentIndex), atScrollPosition: .Left, animated: true)
    }
    
    private func addChildsViewController() {
        for vc in self.tabItem {
            self.addChildViewController(vc)
            vc.didMoveToParentViewController(self)
        }
    }
    
    func addShadowToBar() {
        let navigationBarFrame: CGRect = self.navigationController!.navigationBar.frame
        let shadowView: UIView = UIView(frame: navigationBarFrame)
            shadowView.backgroundColor = UIColor.whiteColor()
            shadowView.layer.masksToBounds = false
            shadowView.layer.shadowOpacity = 0.4 // your opacity
            shadowView.layer.shadowOffset = CGSize(width: 0, height: 2) // your offset
            shadowView.layer.shadowRadius =  4 //your radius
            shadowView.layer.shadowColor = UIColor.darkGrayColor().CGColor
        self.view.addSubview(shadowView)
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
        let view = self.tabItem[indexPath.section].view
            view.frame = CGRectMake(0, 0, self.collectionView.frame.width, self.collectionView.frame.height)
            cell.addSubview(view)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.collectionView.frame.width, self.collectionView.frame.height)
    }
}

extension UIView {
    func addShadow(root: UIView) {
        let shadowView: UIView = UIView(frame: self.frame)
            shadowView.backgroundColor = UIColor.whiteColor()
            shadowView.layer.masksToBounds = false
            shadowView.layer.cornerRadius = self.layer.cornerRadius
            shadowView.layer.shadowOpacity = 0.4
            shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
            shadowView.layer.shadowRadius =  4
            shadowView.layer.shadowColor = UIColor.darkGrayColor().CGColor
        root.insertSubview(shadowView, belowSubview: self)
    }
}

@IBDesignable class RoundRectView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.blackColor()
    @IBInspectable var borderWidth: CGFloat = 0.5
    private var customBackgroundColor = UIColor.whiteColor()
    override var backgroundColor: UIColor?{
        didSet {
            customBackgroundColor = backgroundColor!
            super.backgroundColor = UIColor.clearColor()
        }
    }
    
    func setup() {
        layer.shadowColor = UIColor.blackColor().CGColor;
        layer.shadowOffset = CGSizeZero;
        layer.shadowRadius = 5.0;
        layer.shadowOpacity = 0.5;
        super.backgroundColor = UIColor.clearColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override func drawRect(rect: CGRect) {
        customBackgroundColor.setFill()
        UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius ?? 0).fill()
        
        let borderRect = CGRectInset(bounds, borderWidth/2, borderWidth/2)
        let borderPath = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius - borderWidth/2)
        borderColor.setStroke()
        borderPath.lineWidth = borderWidth
        borderPath.stroke()
        
        // whatever else you need drawn
    }
}