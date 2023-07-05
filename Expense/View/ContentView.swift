//
//  ContentView.swift
//  Expense
//
//  Created by 胡文博 on 2023/07/03.
//

import SwiftUI

//MVVM
struct ContentView: View {
    @State private var showDetailView = false
    
    // 通过状态对象来订阅,实例化时使用stateObject来标记,如果使用observe的话,当前view被刷新时,会同时被再次实例化
    @StateObject var expense = Expense()
    var body: some View {
        NavigationStack{
            // 当navigationView呼出的页面也是navigationView时,会出现title嵌套的问题,但是在新版本中已经修复
            List {
                ForEach(expense.expenseItems) { expenseItem in
                    NavigationLink {
                        EditView(expense: expense, draftExpenseItem: DraftExpenseItem(expenseItem))
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
                // onDelete方法是foreach的方法
                .onDelete { indexSet in
                    expense.deleteItem(indexSet: indexSet)
                }
            }
            .navigationTitle("账单")
            .toolbar {
                // 利用navigation实现跳转,子页面自带左上角返回功能
                NavigationLink {
                    AddView(expense: expense)
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
//            DetailView(expenseItemsM: $expenseItems)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
