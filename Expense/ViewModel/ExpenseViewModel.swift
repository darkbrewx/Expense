//
//  ExpenseViewModel.swift
//  Expense
//
//  Created by 胡文博 on 2023/07/03.
//

import Foundation
import SwiftUI
// 遵循可被检测对象ObservableObject
class Expense: ObservableObject {
    let viewContext = PersistenceController.shared.container.viewContext
    // 通过publish公开
    @Published
    var expenseItems: [ExpenseItem] = [
//        ExpenseItem(name: "吃饭", type: "餐饮美食", price: "500"),
//        ExpenseItem(name: "坐车", type: "交通出行", price: "600"),
//        ExpenseItem(name: "买衣服", type: "日用百货", price: "20000")
    ]
    
    init() {
        print(NSHomeDirectory())
        getItems()
    }
    
    func getItems() {
        let request = ExpenseItem.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "updateDate", ascending: false)]
        
        do {
            expenseItems = try viewContext.fetch(request)
        } catch {
            fatalError("从SQLite里面取出数据失败: \(error)")
        }
    }
    
    func addItem(name: String, type: String, price: String) {
//        expenseItems.append(item)
//        saveDataToUserDefaults()
        let expenseItem = ExpenseItem(context: viewContext)
        expenseItem.id = UUID().uuidString
        expenseItem.name = name
        expenseItem.type = type
        expenseItem.price = price
        expenseItem.updateDate = Date()
        
        saveViewContext()
        getItems()
    }
    
    func deleteItem(item: ExpenseItem, item2: DraftExpenseItem) {
//        let index = expenseItems.firstIndex { item.id == $0.id }!
//        expenseItems.remove(at: index)
//        saveDataToUserDefaults()
        viewContext.delete(item)
        saveViewContext()
        getItems()
    }
    
    func editItem(draftItem: DraftExpenseItem) {
//        objectWillChange.send()
//        let index = expenseItems.firstIndex { draftItem.id == $0.id }!
//        let expenseItem = ExpenseItem(name: draftItem.name, type: draftItem.type, price: draftItem.price)
//        expenseItems[index] = expenseItem
//        saveDataToUserDefaults()
        
        let index = expenseItems.firstIndex { draftItem.id == $0.id }!
        let expenseItem = expenseItems[index]
        expenseItem.name = draftItem.name
        expenseItem.type = draftItem.type
        expenseItem.price = draftItem.price
        expenseItem.updateDate = Date()
        
        saveViewContext()
        getItems()
    }
    
    func refreshHomeUI() {
        objectWillChange.send()
    }
}

extension Expense {
    
    func saveViewContext() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    
//    func saveDataToUserDefaults() {
//        do {
//            let data = try JSONEncoder().encode(expenseItems)
//            UserDefaults.standard.set(data, forKey: kExpenseItemsKey)
//        } catch {
//            print("编码错误")
//        }
//    }
}
