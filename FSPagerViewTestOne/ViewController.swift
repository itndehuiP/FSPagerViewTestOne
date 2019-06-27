//
//  ViewController.swift
//  FSPagerViewTestOne
//
//  Created by Guerson on 6/26/19.
//  Copyright © 2019 ItandehuiP. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var pagerView: FSPagerView!
    
    @IBOutlet weak var pageControl: FSPageControl!
    
    let bannerDataSource = BannerCatalog.bannerImageNames
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPagerView()
    }

    private func setPagerView() {
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        pagerView.automaticSlidingInterval = 3.0
        pageControl.numberOfPages = bannerDataSource.count
        pageControl.contentHorizontalAlignment = .center
        pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        pageControl.setStrokeColor(.lightGray, for: .normal)
        pageControl.setStrokeColor(.darkGray, for: .selected)
    }

}

extension ViewController: FSPagerViewDelegate, FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return bannerDataSource.count
    }

    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        let name = bannerDataSource[index]
        cell.imageView?.image = UIImage(named: name)
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }

    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }

    
}

