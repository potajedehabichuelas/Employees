//
//  ServiceProtocol.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 15/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import Foundation
import Alamofire

protocol RequestService {
    func performCodableRequest<T: Decodable>(route: APIRouter, decoder: JSONDecoder, completion: @escaping (Result<T, Error>) -> Void) -> DataRequest
    func performRequest(route: APIRouter, completion: @escaping (Result<Data?, Error>) -> Void) -> DataRequest
}

extension RequestService {

    @discardableResult
    func performCodableRequest<T: Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, Error>) -> Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder) { (response: DataResponse<T>) in
                completion(response.result)
        }
    }

    @discardableResult
    func performRequest(route: APIRouter, completion: @escaping (Result<Data?, Error>) -> Void) -> DataRequest {
        return AF.request(route)
            .response(completionHandler: { response in
                completion(response.result)
            })
    }
}
