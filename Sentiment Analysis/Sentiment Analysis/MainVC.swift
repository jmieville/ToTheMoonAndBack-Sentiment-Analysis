//
//  MainVC.swift
//  Sentiment Analysis
//
//  Created by Jean-Marc Kampol Mieville on 3/31/2560 BE.
//  Copyright © 2560 Jean-Marc Kampol Mieville. All rights reserved.
//

import Foundation
import IGListKit

class MainVC: UIViewController {
    
    let collectionView: IGListCollectionView = {
        let view = IGListCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

//
//class MainVC: IGListSectionController, IGListSectionType {
//    
//    let layout = UICollectionViewFlowLayout()
//    let collectionView = IGListCollectionView(frame: .zero, collectionViewLayout: layout)
//    
//    let updater = IGListAdapterUpdater()
//    let adapter = IGListAdapter(updater: updater, viewController: self, workingRangeSize: 0)
//    adapter.collectionView = collectionView
//    
//    // confirming to IGListSectionType
//    var object: String?
//    
//    func numberOfItems() -> Int {
//        return 2
//    }
//    
//    func sizeForItem(at index: Int) -> CGSize {
//        return CGSize(width: collectionContext!.containerSize.width, height: 55)
//    }
//    
//    func cellForItem(at index: Int) -> UICollectionViewCell {
//        let cell = collectionContext!.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as! LabelCell
//        cell.label.text = object
//        return cell
//    }
//    
//    func didUpdate(to object: Any) {
//        self.object = String(describing: object)
//    }
//    
//    func didSelectItem(at index: Int) {}
//}
//
//extension MainVC: IGListAdapterDataSource {
//    // 1
//    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
//        return loader.entries
//    }
//    
//    // 2
//    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
//        return IGListSectionController()
//    }
//    
//    // 3
//    func emptyView(for listAdapter: IGListAdapter) -> UIView? { return nil }
//}
