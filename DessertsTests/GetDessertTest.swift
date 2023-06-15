//
//  GetDessertTest.swift
//  DessertsTests
//
//  Created by user241379 on 6/15/23.
//

import XCTest
@testable import Desserts

final class GetDessertTest: XCTestCase {
    //Class use to test the GET dessert function
    
    func test_demo() {
        XCTAssertTrue(true)
    }
    
    func test_valid_endpoint() async throws {
        let stringURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        do {
            let _ = try await getDessertList(endpoint: stringURL)
        } catch {
            XCTFail("Expecting a valid response, received an error instead")
        }
        XCTAssertTrue(true)
    }
    
    func test_invalid_URL() async throws {
        let stringURL = "hello dst"
        do {
            let _ = try await getDessertList(endpoint: stringURL)
        } catch GetError.invalidURL {
            print("Caught invalidURL")
            XCTAssertTrue(true)
        } catch {
            XCTFail("Expecting GetError.invalidURL, received other error instead")
        }
    }
    
    func test_invalid_response() async throws {
        let stringURL = "https://httpstat.us/404"
        do {
            let _ = try await getDessertList(endpoint: stringURL)
        } catch GetError.invalidResponse {
            print("Caught invalidResponse")
            XCTAssertTrue(true)
        } catch {
            XCTFail("Expecting GetError.Response, received other error instead")
        }
    }
    
    func test_invalid_data() async throws {
        let stringURL = "https://www.google.com/"
        do {
            let _ = try await getDessertList(endpoint: stringURL)
        } catch GetError.invalidData {
            print("Caught invalidData")
            XCTAssertTrue(true)
        } catch {
            XCTFail("Expecting GetError.invalidData, received other error instead")
        }
    }
    
}
