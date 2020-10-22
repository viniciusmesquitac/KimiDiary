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
    func update(object: Vertix, parameters: [AnyHashable: String])
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
    }
    
    public func new() -> Vertix {
        // Cria uma nova entidade vertice com o nome da classe e adiciona dentro do grafo.
        return NSEntityDescription.insertNewObject(forEntityName: Vertix.entityName, into: graph!) as! Vertix
    }
    
    public func save(object: Vertix, parameters: [AnyHashable: String]) {
        
        // Gera uma entidade com descrição para o grafo, apenas com o nome da entidade.
        guard let description = NSEntityDescription.entity(forEntityName: Vertix.entityName, in: graph!) else { fatalError() }
        
        // Gera um objeto grafo que será adicionado no contexto.
        let object = NSManagedObject(entity: description, insertInto: graph!)
        
        // Adiciona os valores adicionados nos parametros.
        for (value, key) in parameters {
            object.setValue(value, forKey: key)
        }
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
    
    
    func update(object: Vertix, parameters: [AnyHashable: String]) {
        let request = NSFetchRequest<Vertix>(entityName: Vertix.entityName)
        
        // Gera um predicate do request buscando o vertix por ID.
        let predicate = NSPredicate(format: "ID = 1")
        request.predicate = predicate
        
        // Outra forma: -> let object = try! graph?.existingObject(with: object!.objectID)
        
        // Recuperar objeto do grafo através de um request.
        let object = try! graph?.fetch(request).first
        
        // Alterar os parametros especificados.
        for (value, key) in parameters {
            object?.setValue(value, forKey: key)
        }
        
        // Salva o contexto/grafo.
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
