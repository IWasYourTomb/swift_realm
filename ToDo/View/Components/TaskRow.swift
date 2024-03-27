//
//  TaskRow.swift
//  ToDo
//
//  Created by matvey on 27.03.2024.
//

import SwiftUI

struct TaskRow: View {
    var title: String
    var complited: Bool
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: complited ? "checkmark.circle" : "circle")
            
            Text(title)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    TaskRow(title: "Test task", complited: false)
}
