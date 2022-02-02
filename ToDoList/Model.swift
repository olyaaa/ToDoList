//
//  Model.swift
//  ToDoList
//
//  Created by Ольга Бондаренко on 12.09.2021.
//

import Foundation

var ToDoList: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
}

func addItem(nameItem: String, isCompleted: Bool = false) {
    ToDoList.append(["Name": nameItem, "isCompleted": isCompleted])
}

func removeItem(at index: Int) {
    ToDoList.remove(at: index)
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = ToDoList[fromIndex]
    ToDoList.remove(at: fromIndex)
    ToDoList.insert(from, at: toIndex)
}

func changeState(at item: Int) -> Bool {
    ToDoList[item]["isCompleted"] = !(ToDoList[item]["isCompleted"] as! Bool)
    return ToDoList[item]["isCompleted"] as! Bool
}

