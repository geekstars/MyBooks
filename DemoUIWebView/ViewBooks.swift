//
//  ViewBooks.swift
//  DemoUIWebView
//
//  Created by Hoàng Minh Thành on 9/16/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class ViewBooks: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {

    var type: String!
    let booksPDF = [
        ("abrieferhistory"),
        ("aspoofonsexdonwireman"),
        ("barrysworldjenvey"),
        ("foreigneduwilliam"),
        ("gonewithtrash"),
        ("gospelbuckydennis"),
        ("oddjobsbowling"),
        ("oneclownshortwright"),
        ("questingromana"),
        ("thedistancetravelled")
    ]
    let booksHTML = [
        ("Lập trình iOS Objective-C")
    ]
    let booksDocx = [
        ("coexistcrane"),
        ("darkkisssylviaday"),
        ("isthislove"),
        ("lovelikethishubbard"),
        ("lumberlacewards")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        type = self.tabBarItem.title
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count: Int!
        switch type {
        case "PDF":
            count = booksPDF.count
        case "DOCX":
            count = booksDocx.count
        case "HTML":
            count = booksHTML.count
        default:
            break
        }
        return count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! ACellBook
        var thubImg: UIImage!
        var nameLabel : String!
        switch type
        {
            case "PDF": thubImg = UIImage(named: (booksPDF[indexPath.item] + (".jpg")))
                        nameLabel = booksPDF[indexPath.item]
            case "DOCX" : thubImg = UIImage(named: (booksDocx[indexPath.item] + (".jpg")))
                        nameLabel = booksDocx[indexPath.item]
            case "HTML" : thubImg = UIImage(named: (booksHTML[indexPath.item]) + (".jpg"))
                        nameLabel = booksHTML[indexPath.item]
            default:
                break
        }
        cell.imageView.image = thubImg
        cell.nameLabel.text = nameLabel
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let viewDetailBook = self.storyboard!.instantiateViewControllerWithIdentifier("DetailBooks") as! DetailBooks
        var urlString : String!
        switch type {
            case "PDF" : urlString = booksPDF[indexPath.item]
            case "DOCX" : urlString = booksDocx[indexPath.item]
            case "HTML" : urlString = booksHTML[indexPath.item]
        default : break
        }
        viewDetailBook.urlString = urlString
        viewDetailBook.type = self.tabBarItem.title!
        self.navigationController?.pushViewController(viewDetailBook, animated: true)
    }
}
