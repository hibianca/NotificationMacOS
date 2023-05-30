//
//  NotificationApp.swift
//  Notification
//
//  Created by Bianca Nathally Bezerra de Lima on 18/05/23.
//

import SwiftUI
import UserNotifications

class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        UNUserNotificationCenter.current().delegate = self
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        return completionHandler([.list, .sound])
    }
}

@main
struct NotificationsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
