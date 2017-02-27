//
//  main.swift
//  hextovariable
//
//  Created by John Lee on 2017-02-27.
//  Copyright © 2017 johnlee. All rights reserved.
//

import Foundation


var colors:[Color] = []
var platformType:PlatformType?

if CommandLine.arguments.count == 1{
  ConsoleIO.printUsage()
  exit(0)
}

for argument in CommandLine.arguments.dropFirst(){
  if argument.range(of: "-h")  != nil || argument.range(of: "--help")  != nil{
    ConsoleIO.printUsage()
    exit(0)
  }else if argument.range(of: "-")  != nil {
    platformType = PlatformType(shortForm: argument.replacingOccurrences(of: "-f", with: ""))
  }else{
    let newColor = Color(hexString: argument)
    newColor.output(platform: platformType)
  }
}
