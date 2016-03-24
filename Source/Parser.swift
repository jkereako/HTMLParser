//
//  Parser.swift
//  HTMLParser
//
//  Created by Jeff Kereakoglow on 3/23/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation
import Fuzi

struct Parser {
  let xPathQuery: String
  let html: String

  func parse() {
    do {
      // if encoding is omitted, it defaults to NSUTF8StringEncoding
      let doc = try HTMLDocument(string: html, encoding: NSUTF8StringEncoding)
      doc.root?.childNodes(ofTypes: [.Text])

      for thing in doc.xpath(xPathQuery) {
        print(thing.stringValue)
      }

    } catch {
      print(error)
    }
  }
}