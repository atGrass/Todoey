//
//  DataManager.swift
//  Todoey
//
//  Created by atimac on 18/12/18.
//  Copyright © 2018 atGrass. All rights reserved.
//

import Foundation

class DataManager {
    
    static var shared = DataManager()
    
    private let arrayKey = "todoListArray"
    private let itemTitleKey = "title"
    private let itemDoneKey = "done"
    
    private let defaultsArray: [Dictionary<String, Any>]
    private let defaults = UserDefaults.standard
    private(set) var itemArray = [Item]()

    private init() {
        self.defaultsArray = [[self.itemTitleKey: "Find Mike", self.itemDoneKey: false],
                              [self.itemTitleKey: "Buy Eggos", self.itemDoneKey: false],
                              [self.itemTitleKey: "Destroy Demogorgon", self.itemDoneKey: false]]
        self.defaults.register(defaults: [self.arrayKey: self.defaultsArray])
        self.userDefaultsToItem()
    }
    
    private func userDefaultsToItem() {
        let array = self.defaults.array(forKey: self.arrayKey) as! [Dictionary<String, Any>]
        for dictionary in array {
            let item = Item()
            item.title = dictionary[self.itemTitleKey] as! String
            item.done = dictionary[self.itemDoneKey] as! Bool
            self.itemArray.append(item)
        }
    }
    
    private func itemToUserDefaults() {
        var array = [Dictionary<String, Any>]()
        for item in self.itemArray {
            let dictionary: Dictionary<String, Any> = [self.itemTitleKey: item.title, self.itemDoneKey: item.done]
            array.append(dictionary)
        }
        self.defaults.set(array, forKey: self.arrayKey)
    }
    
    func replaceItemWith(_ item: Item, atIndex: Int) {
        guard atIndex < self.itemArray.count else {
            print("Error: out of bounds!")
            return
        }
        self.itemArray[atIndex].title = item.title
        self.itemArray[atIndex].done = item.done
        self.itemToUserDefaults()
    }
    
    func addItem(_ item: Item) {
        self.itemArray.append(item)
        self.itemToUserDefaults()
    }
    
}
