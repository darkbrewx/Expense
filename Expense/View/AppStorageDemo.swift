//
//  AppStorageDemo.swift
//  Expense
//
//  Created by 胡文博 on 2023/07/08.
//

import SwiftUI

struct AppStorageDemo: View {
//    @State var nickName = ""
    @AppStorage("nickName") var nickName = ""
    var body: some View {
        Form{
            Section{
                TextField("输入昵称", text: $nickName)
                Text(nickName)
            }
        }
    }
}

struct AppStorageDemo_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageDemo()
    }
}
