//
//  ExpenseItemModel.swift
//  Expense
//
//  Created by 胡文博 on 2023/07/03.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    var name: String
    var type: String
    var price: String
}
