//
//  Extensions.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import Foundation

extension Encodable{
    
    /// encode the instance into JSON data and serilize into a dictionary
    /// - Returns: dictionary containing the encoded properties or empty dictionary
    func asDictionary() -> [String: Any]{
        guard let data = try? JSONEncoder().encode(self) else{
            return [:]
        }
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch{
            return[:]
        }
    }
}
