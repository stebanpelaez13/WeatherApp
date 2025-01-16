//
//  DataCoreManager.swift
//  WeatherApp
//
//  Created by Juan Esteban Peláez Martínez on 15/01/25.
//

import Foundation
import CoreData

class DataCoreManager: DataManagerProtocol {
    
    static let shared = DataCoreManager()
    
    /// Funcion publica para obtener la lista de favoritos
    func fetchFavourites() -> [LocationItem] {
        let items = self.fetchStore()
        return items.map { item in
            LocationItem(name: item.name ?? "", region: item.region ?? "", country: item.country ?? "", id: Int(item.id), lon: item.lon, lat: item.lat)
        }
    }
    
    /// Agregar un nuevo favorito
    func add(_ item: LocationItem) {
        _ = self.createEntityFrom(item: item)
        self.saveStore()
    }
    
    /// Elimina un favorito
    func remove(_ item: LocationItem) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "LocationModel")
        fetchRequest.predicate = NSPredicate(format: "id == %@", String(item.id))
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try self.context.execute(deleteRequest)
        } catch {
            print("Failed delete", error.localizedDescription)
        }
    }
    
    /// Verifica si esta en la lista de favoritos
    func isFavorite(_ item: LocationItem) -> Bool {
        let predicate = NSPredicate(format: "id == %@", String(item.id))
        let items = self.fetchStore(predicate: predicate)
        return items.count == 1
    }
    
    /// Funcion que guarda en CoreData
    private func saveStore() {
        let context = self.context
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Failed to save the context:", error.localizedDescription)
            }
        }
    }
    
    /// Funcion privada que trae la lista de favoritos desde CoreData
    private func fetchStore(predicate: NSPredicate? = nil) -> [LocationModel] {
        let fetchRequest = LocationModel.fetchRequest()
        
        if let predicate = predicate {
            fetchRequest.predicate = predicate
        }
        
        var fetched: [LocationModel] = []
        do {
            fetched = try self.context.fetch(fetchRequest)
        } catch let error {
            print("Error fetching favourites \(error.localizedDescription)")
        }
        return fetched
    }
    
    lazy var context = {
        return self.container.viewContext
    }()
    
    private lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "StoreData")
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Failed to load persistent stores: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    private func createEntityFrom(item: LocationItem) -> LocationModel {
        let model = LocationModel(context: self.context)
        model.id = Int64(item.id)
        model.name = item.name
        model.country = item.country
        model.region = item.region
        model.lat = item.lat
        model.lon = item.lon
        return model
    }
    
}
