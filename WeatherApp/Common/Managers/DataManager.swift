//
//  DataManager.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 1/01/25.
//
import Foundation

protocol DataManagerProtocol: AnyObject {
    func fetchFavourites() -> [LocationItem]
    func add(_ item: LocationItem)
    func remove(_ item: LocationItem)
    func isFavorite(_ item: LocationItem) -> Bool
}

/// Este manager se usa para gestionar el acceso a `defaults`, tambien se pudo haber hecho con CoreData pero no lo vi necesario ya que los favoritos son pocos registros
class DataManager: DataManagerProtocol {
    
    static let shared = DataManager()
    
    private var favourites: [LocationItem]
    
    init() {
        self.favourites = DataManager.fetchStore()
    }
    
    /// Funcion publica para obtener la lista de favoritos
    func fetchFavourites() -> [LocationItem] {
        return self.favourites
    }
    
    /// Agregar un nuevo favorito
    func add(_ item: LocationItem) {
        if !self.favourites.contains(where: { $0.id == item.id }) {
            self.favourites.append(item)
            self.saveStore()
        }
    }
    
    /// Elimina un favorito
    func remove(_ item: LocationItem) {
        if let index = self.favourites.firstIndex(where: { $0.id == item.id } ) {
            self.favourites.remove(at: index)
            self.saveStore()
        }
    }
    
    /// Verifica si esta en la lista de favoritos
    func isFavorite(_ item: LocationItem) -> Bool {
        return self.favourites.contains(where: { $0.id == item.id })
    }
    
    /// Funcion que guarda en los defaults
    private func saveStore() {
        if let data = JSONHelper.encode(self.favourites, type: [LocationItem].self) {
            UserDefaults.standard.set(data, forKey: Constants.Storage.keyFavourites)
        }
    }
    
    /// Funcion privada que trae la lista de favoritos desde los defaults
    private static func fetchStore() -> [LocationItem] {
        guard let data = UserDefaults.standard.object(forKey: Constants.Storage.keyFavourites) as? Data, let list = JSONHelper.decode(data, type: [LocationItem].self) else {
            return []
        }
        return list
    }
    
}
