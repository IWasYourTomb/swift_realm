//
//  ContentView.swift
//  ToDo
//
//  Created by matvey on 27.03.2024.
//

import SwiftUI

struct TasksView: View {
    @ObservedObject var viewModel = TaskViewModel()
    @State var showAddTaks = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            List{
                ForEach(viewModel.tasks, id: \.id){ task in
                    if !task.isInvalidated{
                        TaskRow(title: task.title, complited: task.complited)
                            .onTapGesture {
                                viewModel.updateTask(id: task.id, complited: !task.complited)
                            }
                            .swipeActions(edge: .trailing){
                                Button(role: .destructive){
                                    viewModel.deleteTask(id: task.id)
                                } label:{
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
                .listRowSeparator(.hidden)
            }
            Spacer()
            
            FloatingButton()
                .padding()
                .onTapGesture {
                    showAddTaks.toggle()
                }
        }
        .sheet(isPresented: $showAddTaks){
            AddTaskView().environmentObject(viewModel)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .bottom)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

#Preview {
    TasksView()
}
