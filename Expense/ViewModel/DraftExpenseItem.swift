//
//  DraftExpenseItem.swift
//  Expense
//
//  Created by 胡文博 on 2023/07/04.
//

import Foundation

class DraftExpenseItem: ObservableObject {
    
    @Published var id : UUID
    @Published var name: String
    @Published var type: String
    @Published var price: String
    
    init(_ expenseItem: ExpenseItem) {
        id = expenseItem.id
        name = expenseItem.name
        type = expenseItem.type
        price = expenseItem.price
    }
    
}
