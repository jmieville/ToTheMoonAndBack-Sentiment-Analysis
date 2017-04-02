//
//  MainVC.swift
//  Sentiment Analysis
//
//  Created by Jean-Marc Kampol Mieville on 3/31/2560 BE.
//  Copyright © 2560 Jean-Marc Kampol Mieville. All rights reserved.
//

import Foundation
import IGListKit

class FeedVC: UIViewController {
    
    let messagingSystem = MessagingSystem()
    
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
        
        // connects the collectionView to the adapter
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        messagingSystem.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

extension FeedVC: IGListAdapterDataSource {
    // 1
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        var items: [IGListDiffable] = messagingSystem.messages
        // items += loader.entries as [IGListDiffable]
        return items
    }
    
    // 2
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        
        return MessageSectionController()
    }
    
    // 3
    func emptyView(for listAdapter: IGListAdapter) -> UIView? { return nil }
}