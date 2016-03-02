//
//  XMLParser.swift
//  Student Helper
//
//  Created by Joaquin Castro-Calvo on 3/2/16.
//  Copyright © 2016 Joaquin Castro-Calvo. All rights reserved.
//

import Foundation


@objc protocol XMLParserDelegate{
    func parsingWasFinished()
}

class XMLParser: NSObject, NSXMLParserDelegate{
    var arrParsedData = [Dictionary<String, String>]()
    var DataDictionary = Dictionary<String, String>()
    var currentElement = ""
    var foundCharacters = ""
    var delegate : XMLParserDelegate?
    
    func startParsingWithContentsOfURL(rss: NSURL) {
        let parser = NSXMLParser(contentsOfURL: rss)
        parser!.delegate = self
        parser!.parse()
    }
    
    func parser(parser: NSXMLParser,didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        currentElement = elementName
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if currentElement == "title" || currentElement == "link" || currentElement == "pubDate"{
            foundCharacters += string
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if !foundCharacters.isEmpty {
            
            if elementName == "link"{
                foundCharacters = (foundCharacters as NSString).substringFromIndex(3)
            }
            
            DataDictionary[currentElement] = foundCharacters
            
            foundCharacters = ""
            
            if currentElement == "pubDate" {
                arrParsedData.append(DataDictionary)
            }
        }
    }
    func parserDidEndDocument(parser: NSXMLParser) {
        delegate?.parsingWasFinished()
    }
}