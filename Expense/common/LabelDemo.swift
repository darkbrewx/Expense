//
//  LabelDemo.swift
//  Expense
//
//  Created by 胡文博 on 2023/07/05.
//

import SwiftUI

struct LabelDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            Label("晴天", systemImage: "sun.max")
                .font(.largeTitle)
            
            Label{
                Text("今天")
                    .font(.title)
                Text("天气不错")
                    .font(.body)
                    .foregroundColor(.secondary)
            } icon: {
                Circle()
                    .fill(.green)
                    .frame(width: 55)
                    .overlay {
                        Text("L")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
            }
        }
    }
}

struct LabelDemo_Previews: PreviewProvider {
    static var previews: some View {
        LabelDemo()
    }
}
