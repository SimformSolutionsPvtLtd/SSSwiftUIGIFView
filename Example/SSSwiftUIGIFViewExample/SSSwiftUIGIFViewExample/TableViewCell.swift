//
//  TableViewCell.swift
//  SSSwiftUIGIFViewExample
//
//  Created by Yagnik Bavishi on 15/12/24.
//

import UIKit
import SSSwiftUIGIFView
import SwiftUI
import Foundation

class TableViewCell: UITableViewCell {
        
    @IBOutlet weak var gifContainerView: GIFPlayerContainerView!

        override func awakeFromNib() {
            super.awakeFromNib()
        }
    
  

    func configure(gifName: String) {
        gifContainerView.loadGif(from: gifName, isShowProgressView: true)
    }

}

class NavoTableViewCell: UITableViewCell {
        
    
    //MARK: -
    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }
}
