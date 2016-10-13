//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
  public var amount : Int
  public var currency : String
  
  public func convert(_ to: String) -> Money {
    var usdConversion = convertToUsd(amount: amount, currency: currency)
    switch to {
      case "GBP":
        usdConversion = usdConversion / 2
      case "EUR":
        usdConversion = usdConversion * 3 / 2
      case "CAN":
        usdConversion = usdConversion * 5 / 4
      default:
       break
    }
    return Money(amount: usdConversion, currency: to)
  }
  
  private func convertToUsd(amount: Int, currency: String) -> Int {
    switch currency {
      case "GBP":
        return amount * 2
      case "EUR":
        return amount * 2 / 3
      case "CAN":
        return amount * 4 / 5
      default:
        return amount
    }
  }
  
  public func add(_ to: Money) -> Money {
    if to.currency == self.currency {
      return Money(amount: self.amount + to.amount, currency: to.currency)
    }
    var newMoneyConversion = self.convert(to.currency)
    return Money(amount: to.amount + newMoneyConversion.amount, currency: to.currency)
  }
  
  public func subtract(_ from: Money) -> Money {
    if from.currency == self.currency {
      return Money(amount: self.amount - from.amount, currency: from.currency)
    }
    return Money(amount: self.amount - self.convert(from.currency).amount, currency: from.currency)
  }
}

//////////////////////////////////////
//// Job
////
//open class Job {
//  fileprivate var title : String
//  fileprivate var type : JobType
//
//  public enum JobType {
//    case Hourly(Double)
//    case Salary(Int)
//  }
//  
//  public init(title : String, type : JobType) {
//  }
//  
//  open func calculateIncome(_ hours: Int) -> Int {
//  }
//  
//  open func raise(_ amt : Double) {
//  }
//}
//
//////////////////////////////////////
//// Person
////
//open class Person {
//  open var firstName : String = ""
//  open var lastName : String = ""
//  open var age : Int = 0
//
//  fileprivate var _job : Job? = nil
//  open var job : Job? {
//    get { }
//    set(value) {
//    }
//  }
//  
//  fileprivate var _spouse : Person? = nil
//  open var spouse : Person? {
//    get { }
//    set(value) {
//    }
//  }
//  
//  public init(firstName : String, lastName: String, age : Int) {
//    self.firstName = firstName
//    self.lastName = lastName
//    self.age = age
//  }
//  
//  open func toString() -> String {
//  }
//}
//
//////////////////////////////////////
//// Family
////
//open class Family {
//  fileprivate var members : [Person] = []
//  
//  public init(spouse1: Person, spouse2: Person) {
//  }
//  
//  open func haveChild(_ child: Person) -> Bool {
//  }
//  
//  open func householdIncome() -> Int {
//  }
//}
//
//
//
//
//
