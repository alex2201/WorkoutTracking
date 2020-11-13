//
//  Workout_Tests.swift
//  Workout TrackingTests
//
//  Created by Alexander Lopez Cedillo on 17/05/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import XCTest

class Workout_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func test_workoutFlow_noExercises() throws {
//        let wf = makeWorkoutFlow()
//    }
//
//    private func makeWorkoutFlow() -> WorkoutFlow {
//        return WorkoutFlow()
//    }

}
