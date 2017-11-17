//
//  AppDelegate.swift
//  EmojiLog
//
//  Created by Gunmer on 04/08/2017.
//  Copyright (c) 2017 Gunmer. All rights reserved.
//

import UIKit
import EmojiLog

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //Logger.configuration.change(emojiMap: SmileEmojiMap())
        //Logger.configuration.change(minLevel: .error)
        //Logger.configuration.change(disable: true)
        return true
    }
    
}

