//
//  ExpenseApp.swift
//  Expense
//
//  Created by 胡文博 on 2023/07/03.
//

import SwiftUI

@main
struct ExpenseApp: App {
//    // 通过状态对象来订阅,实例化时使用stateObject来标记,如果使用observe的话,当前view被刷新时,会同时被再次实例化
    @StateObject var expense = Expense()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(expense)
        }
    }
}
