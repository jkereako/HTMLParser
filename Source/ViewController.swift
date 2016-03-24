//
//  ViewController.swift
//  HTMLParser
//
//  Created by Jeff Kereakoglow on 3/23/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    if let filepath = NSBundle.mainBundle().pathForResource("hacker-news", ofType: "html") {
      do {
        let content = try NSString(contentsOfFile: filepath, usedEncoding: nil) as String
        let parser = Parser(
          xPathQuery: "//table[@id=\"hnmain\"]/tr[3]/td/table/tr[16]/td[3]/a", html: content
        )

        parser.parse()
      } catch {
        print(error)
      }
    } else {
      fatalError("hacker-news.html not found!")
    }
  }
}
