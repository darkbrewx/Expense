//
//  ContentView.swift
//  Expense
//
//  Created by 胡文博 on 2023/07/03.
//

import SwiftUI

let expenseItems = [
    ExpenseItem(name: "吃饭", type: "饮食", price: "500"),
    ExpenseItem(name: "坐车", type: "出行", price: "600"),
    ExpenseItem(name: "买衣服", type: "购物", price: "20000")
]

struct ContentView: View {
    @State private var showDetailView = false
    var body: some View {
        NavigationStack{
            // 当navigationView呼出的页面也是navigationView时,会出现title嵌套的问题,但是在新版本中已经修复
            List(expenseItems) { expenseItem in
                NavigationLink {
                    DetailView()
                } label: {
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
            .navigationTitle("账单")
            .toolbar {
                // 利用navigation实现跳转,子页面自带左上角返回功能
                NavigationLink {
                    DetailView()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)

                // 利用button实现,需要自己指定返回键
//                Button {
//                    showDetailView = true
//                } label: {
//                    Image(systemName: "plus")
//                        .foregroundColor(.secondary)
//                }
//                .padding(.horizontal)
            }
        }
//        .sheet(isPresented: $showDetailView) {
//            DetailView()
//        }
        .fullScreenCover(isPresented: $showDetailView) {
            DetailView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
