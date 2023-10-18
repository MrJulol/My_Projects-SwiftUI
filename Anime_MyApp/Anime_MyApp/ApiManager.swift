//
//  ApiManager.swift
//  Anime_MyApp
//
//  Created by Julian Thaler on 16/10/23.
//

import Foundation

final class ApiManager {
    private enum ApiError: Error {
        case invalidURL
    }
    
    func getData<T: Decodable>(url: String, model: T.Type, completion: @escaping(Result<T, Error>) -> ()) {
        guard let url = URL(string: url) else {
            completion(.failure(ApiError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error { completion(.failure(error)) }
                return
            }
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(serverData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
