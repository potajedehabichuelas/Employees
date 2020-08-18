//
//  APIRouter.swift
//  Employees
//
//  Created by Daniel Bolivar Herrera on 15/08/2020.
//  Copyright © 2020 Daniel Bolivar Herrera. All rights reserved.
//

import Alamofire

protocol APIRouter: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}

extension APIRouter {
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {

        let url = try ServerURL.base.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(self.path))
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }

        return urlRequest
    }
}
