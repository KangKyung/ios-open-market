//
//  NetworkHelper.swift
//  OpenMarket
//
//  Created by steven on 2021/05/18.
//

import Foundation

enum HttpMethod {
    static let get = "GET"
    static let post = "POST"
    static let patch = "PATCH"
    static let delete = "DELETE"
}

enum RequestAddress {
    static let BaseURL = "https://camp-open-market-2.herokuapp.com/"
    static let items = "items/"
    static let item = "item/"
    
    case readList(page: Int)
    case readItem(id: Int)
    case createItem
    case updateItem(id: Int)
    case deleteItem(id: Int)
    
    var url: String {
        switch self {
        case .readList(let page):
            return RequestAddress.BaseURL + RequestAddress.items + String(page)
        case .readItem(let id):
            return RequestAddress.BaseURL + RequestAddress.item + String(id)
        case .createItem:
            return RequestAddress.BaseURL + RequestAddress.item 
        case .updateItem(let id):
            return RequestAddress.BaseURL + RequestAddress.item + String(id)
        case .deleteItem(let id):
            return RequestAddress.BaseURL + RequestAddress.item + String(id)
        }
    }
}

struct NetworkHelper {
    
    let session: URLSession
    init (session: URLSession = .shared) {
        self.session = session
    }
    
    func readList(pageNum: Int, completion: @escaping (Result<ItemsList, Error>) -> Void) {
        guard let url = URL(string: RequestAddress.readList(page: pageNum).url),
              let data = try? String(contentsOf: url).data(using: .utf8),
              let response = try? JSONDecoder().decode(ItemsList.self, from: data)
        else {
            completion(.failure(fatalError()))
            return
        }
        completion(.success(response))        
    }
}
