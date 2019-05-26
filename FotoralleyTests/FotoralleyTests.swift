//
//  FotoralleyTests.swift
//  FotoralleyTests
//
//  Created by Aaqib Hussain on 20/5/19.
//  Copyright © 2019 Aaqib Hussain. All rights reserved.
//

import XCTest
@testable import Fotoralley

class FotoralleyTests: XCTestCase {
    
    let fotorian = FotorianListViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        fotorian.fotorianListModel.downloadManager = RequestManagerMock()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchFotorians() {
        let path = Bundle.main.path(forResource: "Profiles", ofType: "json")
        fotorian.fotorianListModel.fetchFotorians(url: path!)
        let profiles = fotorian.fotorianListModel.profiles
        XCTAssert(profiles.first!.user!.name == "Nicholas Kampouris")
        XCTAssert(profiles.first!.user!.username == "nicholaskampouris")
        XCTAssert(profiles.last!.user!.name == "Johan Mouchet")
        XCTAssert(profiles.last!.user!.username == "johanmouchet")
        XCTAssert(profiles.count == 8, "\(profiles.count)")
    }
    
}

