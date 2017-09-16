//
//  ViewController.swift
//  longTapExample
//
//  Created by MURAKAMI on 2017/09/16.
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.subviews.forEach { (view) in
            // ボタンとラベルが混在している
            guard let view = view as? UIButton else { return }
            let longTapGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(gesture:)))
            view.addGestureRecognizer(longTapGesture)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // ボタンをロングタップした時に呼ばれる処理
    func longPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state != .began {
            return
        }
        
        // ボタンのtag + 100 = 対応するラベルのtag
        guard let btn: UIButton = gesture.view as? UIButton else { return }
        let lbltag: Int = btn.tag + 100
        if let lbl = self.view.viewWithTag(lbltag) as? UILabel {
            lbl.isHidden = true
        }
    }
}

