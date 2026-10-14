//
//  ChatAPI.swift
//  PorteAI
//
//  Created by Laxman Penmetsa on 10/12/26.
//

import Foundation

struct CharRequest: Encodable {
    let message: String
}

struct ChatResponse: Decodable {
    let response: String
}

final class ChatAPI {
    private let baseURL = URL(string: "http://127.0.0.1:8000")!
    
    func sendMessage(_ message: String) async throws -> String {
        let url = baseURL.appendingPathComponent("chat")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder ().encode(CharRequest(message: message))
       let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let result =  try JSONDecoder().decode(ChatResponse.self, from: data)
        print(result.response.lowercased())
        return result.response
    }
}
