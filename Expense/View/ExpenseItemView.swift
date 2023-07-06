//
//  ExpenseItemView.swift
//  Expense
//
//  Created by 胡文博 on 2023/07/05.
//

import SwiftUI

struct ExpenseItemView: View {
    var expenseItem: ExpenseItem
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 4){
                Text(expenseItem.name).font(.headline)
                Text(expenseItem.type)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(expenseItem.price)
        }
    }
}

//struct ExpenseItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpenseItemView()
//    }
//}
