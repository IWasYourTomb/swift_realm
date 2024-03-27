//
//  AddTaskView.swift
//  ToDo
//
//  Created by matvey on 27.03.2024.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var viewModel: TaskViewModel
    @State private var taskTitle: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment:.leading, spacing: 20){
            Text("Create new Task")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField(
                "Enter new task title",
            text: $taskTitle)
            .textFieldStyle(.roundedBorder)
            
            Button{
                if taskTitle != ""{
                    viewModel.addTaks(taskTitle: taskTitle)
                }
                dismiss()
            } label:{
                Text("Add new Task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .cornerRadius(30)
                    .background(Color(hue: 0.328, saturation: 0.796, brightness: 0.408))
            }
            
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
    }
}

#Preview {
    AddTaskView()
}
