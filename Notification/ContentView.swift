//
//  ContentView.swift
//  Notification
//
//  Created by Bianca Nathally Bezerra de Lima on 18/05/23.
//

import SwiftUI
import Foundation
import UserNotifications

struct ContentView: View {
    
    let un = UNUserNotificationCenter.current()
    
    var body: some View {
        //VStack {
            
            //Text("Click to receive a notification")
            
            Button("Notify", action: {
                
                // Request authorization
                un.requestAuthorization(options: [.alert, .sound]) { authorized, error in
                    if authorized {
                        print("Authorized")
                    } else if !authorized {
                        print("Not authorized")
                    } else {
                        print(error?.localizedDescription as Any)
                    }
                }
                
                un.getNotificationSettings { (settings) in
                    if settings.authorizationStatus == .authorized {
                        let content = UNMutableNotificationContent()
                        
                        content.title = "Barbie World"
                        content.subtitle = "This is a subtitle"
                        content.body = "This is the body text"
                        content.sound = UNNotificationSound.default
                        content.categoryIdentifier = "barbieCoins"
                        
                        let id = "Test"
                        let filePath = Bundle.main.path(forResource: "barbie", ofType: ".png")
                        let fileURL = URL(fileURLWithPath: filePath!)
                        
                        do {
                            let attachment = try UNNotificationAttachment.init(identifier: "Another test", url: fileURL, options: .none)
                            
                            content.attachments = [attachment]
                        } catch let error {
                            print(error.localizedDescription)
                        }
                        
                        let buy = UNNotificationAction(identifier: "buy", title: "Buy", options: [.foreground])
                        let sell = UNNotificationAction(identifier: "sell", title: "Sell", options: [.foreground])
                        let hodl = UNNotificationAction(identifier: "hodl", title: "Hodl", options: [.foreground])

                        
                        let category = UNNotificationCategory(identifier: "barbieCoins", actions: [buy, sell, hodl], intentIdentifiers: [], options: [])
                        
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
                        
                        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                        
                        self.un.setNotificationCategories([category])
                        
                        self.un.add(request) { (error) in
                            if error != nil { print(error?.localizedDescription as Any)}
                        }
                    }
                }
            })
        //}
        //.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
