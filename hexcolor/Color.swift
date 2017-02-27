//
//  Color.swift
//  hextovariable
//
//  Created by John Lee on 2017-02-27.
//  Copyright © 2017 johnlee. All rights reserved.
//

import Foundation
enum PlatformType{
  case swiftIos, swiftMac, objcIos, objcMac, cSharpIos
  init?(shortForm:String){
    switch shortForm{
      case "si":
        self = .swiftIos
      case "sm":
      self = .swiftMac
      case "oi":
      self = .objcIos
      case "om":
      self = .objcMac
      case "ci":
      self = .cSharpIos
    default:
      return nil
    }
  }
}


struct Color {
  let red:Float
  let green:Float
  let blue:Float
  let alpha:Float
  init(hexString: String) {
    let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int = UInt32()
    Scanner(string: hex).scanHexInt32(&int)
    let a, r, g, b: UInt32
    switch hex.characters.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (255, 0, 0, 0)
    }
    red = Float(r) / 255
    green =  Float(g) / 255
    blue = Float(b) / 255
    alpha = Float(a) / 255
  }
  func swift() -> String{
    return "UIColor(red:\(red), green:\(green), blue:\(blue), alpha:\(alpha))"
  }
  func objc() -> String{
    return "UIColor(red:\(red), green:\(green), blue:\(blue), alpha:\(alpha))"
  }
  func output(platform: PlatformType?){
    if(platform != nil){
      switch(platform!){
      case .swiftIos:
        print("UIColor(red:\(red), green:\(green), blue:\(blue), alpha:\(alpha))")
      case .swiftMac:
        print("NSColor(red:\(red), green:\(green), blue:\(blue), alpha:\(alpha))")
      case .objcIos:
        print("[UIColor colorWithRed:\(red) green:\(green) blue:\(blue) alpha:\(alpha)];")
      case .objcMac:
        print("[NSColor colorWithRed:\(red) green:\(green) blue:\(blue) alpha:\(alpha)];")
      case .cSharpIos:
        print("new UIColor(red:\(red)f, green:\(green)f, blue:\(blue)f, alpha:\(alpha))f")
      }
    }else{
      output(platform: .swiftIos)
      output(platform: .swiftMac)
      output(platform: .objcIos)
      output(platform: .objcMac)
      output(platform: .cSharpIos)
    }
  }
}
