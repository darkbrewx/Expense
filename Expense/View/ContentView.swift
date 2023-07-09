//
//  ContentView.swift
//  Expense
//
//  Created by 胡文博 on 2023/07/03.
//

import SwiftUI

//MVVM
struct ContentView: View {
    
    @State private var isUnread = true
//    @State private var showDetailView = false
    // 通过状态对象来订阅,实例化时使用stateObject来标记,如果使用observe的话,当前view被刷新时,会同时被再次实例化
//    @StateObject var expense = Expense()
//    @ObservedObject var expense = Expense()
    @EnvironmentObject var expense: Expense
    
    var body: some View {
        NavigationView{
            // 当navigationView呼出的页面也是navigationView时,会出现title嵌套的问题,但是在新版本中已经修复
            List(expense.expenseItems, id: \.id) { expenseItem in
                NavigationLink {
                    EditView(draftExpenseItem: DraftExpenseItem(expenseItem))
                } label: {
                    ExpenseItemView(expenseItem: expenseItem)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button {
                        isUnread.toggle()
                    } label: {
                        if isUnread {
                            Label("标记为已读", systemImage: "envelope.open")
                        } else {
                            Label("标记为未读", systemImage: "envelope.badge")
                        }
                    }
                    .tint(.blue)
                }
                .swipeActions {
                    // fullswipe时触发第一个按钮的功能
                    Button(role: .destructive) {
                        expense.deleteItem(item: expenseItem, item2: DraftExpenseItem(expenseItem))
                    } label: {
                        Label("删除账单", systemImage: "trash")
                    }
                    
                    Button {
                        
                    } label: {
                        Label("标记账单", systemImage: "flag")
                    }
                    .tint(.orange)
                }
//                ForEach(expense.expenseItems) { expenseItem in
//                }
                // onDelete方法是foreach的方法
//                .onDelete { indexSet in
//                    expense.deleteItem(indexSet: indexSet)
//                }
            }
            .navigationTitle("账单")
            .toolbar {
                // 利用navigation实现跳转,子页面自带左上角返回功能
                NavigationLink {
                    AddView()
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
        .navigationViewStyle(.stack)
//        .sheet(isPresented: $showDetailView) {
//            DetailView()
//        }
//        .fullScreenCover(isPresented: $showDetailView) {
//            DetailView(expenseItemsM: $expenseItems)
//        }
        // 多个对象的话,需要是不同类型,否则系统会无法识别
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Expense())
    }
}
