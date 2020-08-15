//
//  ServiceProtocol.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 15/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import Foundation
import Alamofire

//NOTES:

/*

 This is a code that I often use to wrap the network library selected for the project (In most cases if not all it's been Alamofire though :P)

    So when I was using this code I had to update it since I last used a while ago and to make it compile nicely I had to modify some types in the protocol which I'm not happy about but for the assignment sake I decided not to spend much time digging into it.

    The core of the issue is that the protocol is there to fully wrap and hide whatever mechanism or library is used for networking and by having Alamofire specific types in the protocol declaration we're exposing the library to the outer layers of the app which is not cool.
    So Ideally I would look into what changes in the datatypes have happened so I can use the right ones and avoid exposing dependencies specific types.

*/

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
