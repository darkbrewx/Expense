//
//  EditView.swift
//  Expense
//
//  Created by 胡文博 on 2023/07/04.
//

import SwiftUI

struct EditView: View {
    // private属性
    private let types = ["日用百货", "餐饮美食", "数码电器", "教育培训", "充值缴费", "交通出行"]
    @Environment(\.dismiss) var dismiss
    
    // 可以被传值的数据
    // 通过观察对象来订阅
//    @ObservedObject var expense: Expense
    @EnvironmentObject var expense: Expense
    @ObservedObject var draftExpenseItem: DraftExpenseItem
        
    var body: some View {
        Form{
            Section("账单名") {
                TextField("收入或支出项目", text: $draftExpenseItem.name)
            }
            Section("账单分类") {
                Picker("选择一个分类", selection: $draftExpenseItem.type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
            }
            Section("金额") {
                TextField("收入或支出的金额", text: $draftExpenseItem.price)
                    .keyboardType(.numberPad)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("编辑账单")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    expense.refreshHomeUI()
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primary)
                }
                .padding(.horizontal)

            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    expense.editItem(draftItem: draftExpenseItem)
                    dismiss()
                } label: {
                    Text("保存")
                        .foregroundColor(.primary)
                }
                .padding(.horizontal)
            }
        }
    }
}

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView(expense: Expense(), expenseItem: ExpenseItem(name: "买衣服", type: "日用百货", price: "20000"))
//    }
//}
