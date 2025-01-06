//
//  Dictionary+Extension.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 06/01/25.
//

extension Dictionary {

    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            if let nKey = String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
               let nValue = String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                parts.append("\(nKey)=\(nValue)")
            }
        }
        return parts.joined(separator: "&")
    }
}
