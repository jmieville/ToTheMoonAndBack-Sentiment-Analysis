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
    
}

extension MainVC: IGListSectionController, IGListSectionType {
    
    let layout = UICollectionViewFlowLayout()
    let collectionView = IGListCollectionView(frame: .zero, collectionViewLayout: layout)
    
    let updater = IGListAdapterUpdater()
    let adapter = IGListAdapter(updater: updater, viewController: self, workingRangeSize: 0)
    adapter.collectionView = collectionView
    
    // confirming to IGListSectionType
    var object: String?
    
    func numberOfItems() -> Int {
        return 2
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as! LabelCell
        cell.label.text = object
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.object = String(describing: object)
    }
    
    func didSelectItem(at index: Int) {}
}
