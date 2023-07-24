//
//  EpubReader.swift
//  EpubReader
//
//  Created by Dương Hoàng on 23/07/2023.
//

import Foundation
import UIKit

open class EpubReader: NSObject {
    open func openEpubReader(parentViewController: UIViewController, withEpubPath epubPath: String, unzipPath: String, window: UIWindow) {
        let rootVC = IRReaderCenterViewController.init(withPath: epubPath, unzipPath: unzipPath, window: window)
        let navVc = UINavigationController(rootViewController: rootVC)
            parentViewController.present(navVc, animated: true, completion: nil)
        }
}
