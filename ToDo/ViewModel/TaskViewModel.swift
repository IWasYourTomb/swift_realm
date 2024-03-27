//
//  TaskViewModel.swift
//  ToDo
//
//  Created by matvey on 27.03.2024.
//

import Foundation
import RealmSwift

class TaskViewModel: ObservableObject{
    private(set) var realm: Realm?
    @Published var tasks: [TaskModel] = []
 
    init(){
        openRealm()
    }
    
    func openRealm(){
        do{

            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            realm = try Realm()
        }catch{
            print("Error opening Realm", error)
        }
    }
    
    func getTask(){
        if let realm = realm{
            let allTask = realm.objects(TaskModel.self).sorted(byKeyPath: "complited")
            
            tasks = []
            
            allTask.forEach{ task in
                tasks.append(task)
            }
        }
    }
    
    func addTaks(taskTitle: String){
        if let realm = realm{
            do{
                try realm.write{
                    let newTask = TaskModel(value: ["title": taskTitle, "complited": false])
                    realm.add(newTask)
                    
                    getTask()
                }
            }catch{
                print("Error adding task to Realm: \(error)")
            }
        }
    }
    
    func deleteTask(id: ObjectId){
        if let realm = realm{
            do{
                let taskToDelete = realm.objects(TaskModel.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !taskToDelete.isEmpty else{return}
                
                try realm.write{
                    
                    realm.delete(taskToDelete)
                    getTask()
                }
            }catch{
                print("Error deleting task \(id) to Realm: \(error)")
            }
        }
    }
    
    func updateTask(id: ObjectId, complited: Bool){
        if let realm = realm{
            do{
                let taskToUpdate = realm.objects(TaskModel.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !taskToUpdate.isEmpty else{return}
                
                try realm.write{
                    
                    taskToUpdate[0].complited = complited
                    getTask()
                }
            }catch{
                print("Error updating task \(id) to Realm: \(error)")
            }
        }
    }
    
}
