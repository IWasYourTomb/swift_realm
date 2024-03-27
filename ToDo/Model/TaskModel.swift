//
//  TaskModel.swift
//  ToDo
//
//  Created by matvey on 27.03.2024.
//

import Foundation
import RealmSwift

class TaskModel: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var complited = false
}
