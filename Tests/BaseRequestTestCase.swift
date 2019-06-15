//
//  BaseRequestTestCase.swift
//  Tests
//
//  Created by Denys Telezhkin on 6/15/19.
//  Copyright © 2019 Denys Telezhkin. All rights reserved.
//

import XCTest

class BaseRequestTestCase: ProtocolStubbedTestCase {

    func testParametersDSLAppendsParameters() {
        let request : APIRequest<Int,APIError> = tron.swiftyJSON
            .request("status/200")
            .parameters([
                "foo":"bar",
                "1":"2"
                ])
            .parameters([
                "3":"4"
                ])
        
        XCTAssertEqual(request.parameters as? [String:String], [
            "foo":"bar",
            "1":"2",
            "3": "4"
            ])
    }
    
    func testParametersDSLAcceptsNils() {
        let optional: Int? = nil
        let filledOptional: Int? = 3
        let request : APIRequest<Int,APIError> = tron.swiftyJSON
            .request("status/200")
            .optionalParameters([
                "empty":optional,
                "filled":filledOptional
                ])
        
        XCTAssertEqual(request.parameters["filled"] as? Int, 3)
        XCTAssertNil(request.parameters["optional"])
    }
    
    func testParametersDSLReplacesNilWithNull() throws  {
        let optional: Int? = nil
        let filledOptional: Int? = 3
        let request : APIRequest<Int,APIError> = tron.swiftyJSON
            .request("status/200")
            .optionalParameters([
                "empty":optional,
                "filled":filledOptional
                ], setNilToNull: true)
        
        let json = try JSONSerialization.data(withJSONObject: request.parameters, options: .prettyPrinted)
        let jsonObject = try JSONSerialization.jsonObject(with: json, options: .allowFragments)
        
        XCTAssertEqual((jsonObject as? [String: Any])?["empty"] as? NSNull, NSNull())
        XCTAssertEqual((jsonObject as? [String: Any])?["filled"] as? Int, 3)
    }
}
