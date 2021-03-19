import XCTest
@testable import HookKit

final class HookKitTests: XCTestCase {

    func testSingleInvocation() {
        let hooks = HookStorage()
        hooks.register("test") { _ in "Hello world" }
        let result: String? = hooks.invoke("test")
        XCTAssertEqual(result, "Hello world")
    }
    
    func testSingleTypedInvocation() {
        let hooks = HookStorage()
        hooks.register("test") { _ in 123 }
        hooks.register("test") { _ in "Hello world" }
        let result: String? = hooks.invoke("test")
        XCTAssertEqual(result, "Hello world")
    }
    
    func testSingleArguments() {
        let hooks = HookStorage()
        hooks.register("test") { args in args["foo"] as! String }
        let result: String? = hooks.invoke("test", args: ["foo": "bar"])
        XCTAssertEqual(result, "bar")
    }

    func testMultiInvocation() {
        let hooks = HookStorage()
        hooks.register("test") { _ in 1 }
        hooks.register("test") { _ in 2 }
        let result: [Int] = hooks.invokeAll("test")
        XCTAssertEqual(result, [1, 2])
    }
    
    func testMultiTypedInvocation() {
        let hooks = HookStorage()
        hooks.register("test") { _ in 1 }
        hooks.register("test") { _ in 2 }
        hooks.register("test") { _ in "Hello world" }
        let result: [Int] = hooks.invokeAll("test")
        XCTAssertEqual(result, [1, 2])
    }
}
