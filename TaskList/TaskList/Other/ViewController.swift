//
//  ViewController.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 06.01.2024.
//

import Foundation

import UIKit
import IQKeyboardManagerSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Prevent the keyboard from covering up specific UITextField or UITextView instances
        IQKeyboardManager.shared.enableAutoToolbar = false
    }
}
