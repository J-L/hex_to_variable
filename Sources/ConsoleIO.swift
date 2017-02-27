//
//  ConsoleIO.swift
//  hextovariable
//
//  Created by John Lee on 2017-02-27.
//  Copyright © 2017 johnlee. All rights reserved.
//

import Foundation


class ConsoleIO {
  class func printUsage() {
    let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
    
    print("\nUsage:")
    print("\(executableName) [-fX] [hex_string ...]")
    print("\nOptions [-f]:")
    print("  -fsi  swift ios")
    print("  -fsm  swift mac")
    print("  -foi  objc ios")
    print("  -fci  C# ios")
    print("\nHex String Formats:")
    print("  rgb - 3 Digit Hex Color")
    print("  rrggbb - 6 Digit Hex Color")
    print("  aarrggbb - 8 Digit Hex Color")
    
  }
}
