//
//  NetworkingManager.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 27/01/26.
//

import Foundation
import Combine
class NetworkingManager{
    
    enum NetworkingManager: LocalizedError{
        case badUrlResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badUrlResponse(url: let URL): return"Bad response from URl"
            case .unknown: return "Unknown Error Occured"
            }
        }
    }
    static func download(url: URL) -> AnyPublisher<Data, Error> {
    return URLSession.shared.dataTaskPublisher(for: url)
              .subscribe(on: DispatchQueue.global(qos: .default))
              .tryMap({ try handleURLResponse(output: $0, url: url)})
            
              .receive(on: DispatchQueue.main)
              .eraseToAnyPublisher()
    }
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{
        //throw NetworkingManager.badUrlResponse(url: url)

        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingManager.badUrlResponse(url: url)
            
        }
        return output.data

    }
    static func handleCompletion(completion: Subscribers.Completion<Error>){
        switch completion{
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
