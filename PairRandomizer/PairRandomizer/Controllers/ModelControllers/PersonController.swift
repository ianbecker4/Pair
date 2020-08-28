//
//  PersonController.swift
//  PairRandomizer
//
//  Created by Ian Becker on 8/28/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import Foundation

class PersonController {
    
    // MARK: - Properties
    /// Shared Instance
    static let shared = PersonController()
    /// Source of Truth
    var people: [Person] = []
    
    //Initialize loadfromstore
    
    // MARK: - CRUD Functions (Create and Delete)
    func createPersonWith(fullName: String) {
        let newPerson = Person(fullName: fullName)
        people.append(newPerson)
        // SAVE
    }
    
    func deletePerson(person: Person) {
        guard let index = people.firstIndex(of: person) else {return}
        people.remove(at: index)
        // SAVE
    }
    
    // MARK: - Persistence
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let filename = "pairRandomizer.json"
        let fullURL = documentDirectory.appendingPathComponent(filename)
        return fullURL
    }
    
    func saveToPersistentStore() {
        
        do {
            let data = try JSONEncoder().encode(people)
            print(data)
            print(String(data: data, encoding: .utf8)!)
            try data.write(to: fileURL())
        } catch let error {
            print("Error saving people \(error)")
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            let data = try Data(contentsOf: fileURL())
            let people = try JSONDecoder().decode([Person].self, from: data)
            self.people = people
        } catch let error {
            print("Error loading data from disk \(error)")
            print("\(#file)\(#line)")
        }
    }
}
