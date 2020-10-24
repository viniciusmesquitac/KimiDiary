//
//  CoreService.swift
//  Earthquakes
//
//  Created by Vinicius Mesquita on 19/10/20.
//  Copyright © 2020 VInicius Mesquita. All rights reserved.
//

import UIKit
import CoreData

enum EntityIdentifier {
    static let entity = "Entity"
}

extension NSManagedObject {
    static var entityName: String {
        return String(describing: self)
    }
}

protocol ConfigurableCoreService {
    associatedtype Vertix
    func insert(object: Vertix)
    func delete(object: Vertix)
    func fetchAll() -> [Vertix]?
}

protocol ConfigurableUndo {
    associatedtype Vertix
    func remove(_ object: Vertix)
    func restore(_ object: Vertix)
}

final class CoreService<Vertix: NSManagedObject>: ConfigurableCoreService {
    // var container: NSPersistentContainer? <- Pra que serve isso?!
    
    // Contexto ou grafo :D
    var graph: NSManagedObjectContext?
    
    // Restaura objetos deletados.
    var undoManager: UndoManager?
    
    init(descriptionName: String) {
        
        // Recupera co contexto gerado no app delegate.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        self.graph = appDelegate.persistentContainer.viewContext
        self.graph?.automaticallyMergesChangesFromParent = true
    }
    
    public func new() -> Vertix {
        // Cria uma nova entidade vertice com o nome da classe e adiciona dentro do grafo.
        return NSEntityDescription.insertNewObject(forEntityName: Vertix.entityName, into: graph!) as! Vertix
    }
    
    public func fetchAll() -> [Vertix]? {
        // Solicitação de request do vertice passando o critério "Vertix.className"
        let request = NSFetchRequest<Vertix>(entityName: Vertix.entityName)
        
        // Solicita request de todos os verticies ligados a entidade e retorna em array.
        return try! graph?.fetch(request)
    }
    
    public func delete(object: Vertix) {
        graph?.delete(object)
        save()
    }
    
    public func insert(object: Vertix) {
        graph?.insert(object)
        save()
    }
    
    func find() {
        let request = NSFetchRequest<Vertix>(entityName: Vertix.entityName)
    }
    
    
    public func save() {
        do {
            try graph?.save()
        } catch {
            print(error)
        }
    }
    
}


extension CoreService: ConfigurableUndo {
    
    func remove(_ object: Vertix) {
        undoManager!.registerUndo(withTarget: self) { targetSelf in
            targetSelf.restore(object)
        }
        undoManager?.setActionName("Remove Note")

        // Deleta o objeto.
        self.delete(object: object)
    }
    
    func restore(_ object: Vertix) {
        undoManager!.registerUndo(withTarget: self) { targetSelf in
            targetSelf.remove(object)
        }
        undoManager?.setActionName("Remove Note")

        // Restaura o objeto.
        self.insert(object: object)
    }
    
}
