//
//  ExpenseViewModel.swift
//  Expense
//
//  Created by 胡文博 on 2023/07/03.
//

import Foundation
// 遵循可被检测对象ObservableObject
class Expense: ObservableObject {
    // 通过publish公开
    @Published
    var expenseItems = [
        ExpenseItem(name: "吃饭", type: "餐饮美食", price: "500"),
        ExpenseItem(name: "坐车", type: "交通出行", price: "600"),
        ExpenseItem(name: "买衣服", type: "日用百货", price: "20000")
    ]
    
    func addItem(item: ExpenseItem) {
        expenseItems.append(item)
//        objectWillChange.send()
    }
    
    func deleteItem(indexSet: IndexSet) {
        expenseItems.remove(atOffsets: indexSet)
//        objectWillChange.send()
    }
    
    func editItem(draftItem: DraftExpenseItem) {
//        objectWillChange.send()
        let index = expenseItems.firstIndex { draftItem.id == $0.id }!
        let expenseItem = ExpenseItem(name: draftItem.name, type: draftItem.type, price: draftItem.price)
        expenseItems[index] = expenseItem
    }
    
    func refreshHomeUI() {
        objectWillChange.send()
    }
}
