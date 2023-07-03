//
//  DetailView.swift
//  Expense
//
//  Created by 胡文博 on 2023/07/03.
//

import SwiftUI

struct DetailView: View {
    private let types = ["日用百货", "餐饮美食", "数码电器", "教育培训", "充值缴费", "交通出行"]
    @State private var name = ""
    @State private var type = "日用百货"
    @State private var price = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
//        NavigationStack{
//        From { ... }
//        }
        // 即便不在navigationView中,也可以调用navigation的后缀,因为前置的页面会提供bar
        Form{
            Section("账单名") {
                TextField("收入或支出项目", text: $name)
            }
            Section("账单分类") {
                Picker("选择一个分类", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
            }
            Section("金额") {
                TextField("收入或支出的金额", text: $price)
                    .keyboardType(.numberPad)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("添加账单")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primary)
                }
                .padding(.horizontal)

            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
    //                    expenseItems.append(ExpenseItem(name: name, type: type, price: price))
                } label: {
                    Text("保存")
                        .foregroundColor(.primary)
                }
                .padding(.horizontal)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
