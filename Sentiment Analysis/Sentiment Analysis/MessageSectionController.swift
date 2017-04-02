//
//  TextReplySectionController.swift
//  Sentiment Analysis
//
//  Created by Jean-Marc Kampol Mieville on 4/2/2560 BE.
//  Copyright © 2560 Jean-Marc Kampol Mieville. All rights reserved.
//

import UIKit
import IGListKit

class MessageSectionController: IGListSectionController {
    var message: Message!
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    }
}

extension MessageSectionController: IGListSectionType {
    /**
     Tells the section that the cell at the specified index path was selected.
     
     @param index The index of the selected cell.
     */
    func didSelectItem(at index: Int) {
        
    }

    /**
     Tells the section that the controller was updated to a new object.
     
     @param object The object mapped to this section controller.
     
     @note When this method is called, all available contexts and configurations have been set for the section
     controller. Also, depending on the updating strategy used, your item models may have changed objects in memory, so you
     can use this event to update the object stored on your section controller.
     
     This method will only be called when the object instance has changed, including from `nil` or a previous object.
     */
    func didUpdate(to object: Any) {
        message = object as? Message
    }

    /**
     Asks the section controller for a fully configured cell at the specified index.
     
     @param index The index of the requested row.
     
     @return A configured `UICollectionViewCell` subclass.
     
     @note This is your opportunity to do any cell setup and configuration. The infrastructure requests a cell when it
     will be used on screen. You should never allocate new cells in this method, instead use the provided adapter to call
     `-dequeCellClass:forIndexPath:` which either deques a cell from the collection view or creates a new one for you.
     */
    @available(iOS 6.0, *)
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(of: MessageCell.self, for: self, at: index) as! MessageCell
        cell.messageLabel.text = message.text
        cell.titleLabel.text = message.user.name.uppercased()
        return cell
    }

    /**
     The specific size for the item at the specified index.
     
     @param index The row index of the item.
     
     @return The size for the item at index.
     
     @note The returned size is not garaunteed to be used. The implementation may query sections for their
     layout information at will, or use its own layout metrics. For example, consider a dynamic-text sized list versus a fixed
     height-and-width grid. The former will ask each section for a size, and the latter will likely not.
     */
    func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext, let message = message else { return .zero }
        
        let width = context.containerSize.width
        return MessageCell.cellSize(width: width, text: message.text)
    }

    /**
     Returns the number of items in the section.
     
     @return A count of items in the list.
     
     @note The count returned is used to drive the number of cells displayed for this list. You are free to change
     this value between data loading passes.
     */
    func numberOfItems() -> Int {
        return 1
    }
    
}
