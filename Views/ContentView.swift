//
//  ContentView.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var selectedTab: Tab? = .home
    
    init() {
        checkForPermission()
        dispatchNotification()
    }
    
    var body: some View {
        TabBarView()
    }
    
    func checkForPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                self.dispatchNotification()
            case .denied:
                print("L'utente ha negato l'autorizzazione alle notifiche.")
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow {
                        self.dispatchNotification()
                    }
                }
            default:
                return
            }
        }
    }
    
    
    func dispatchNotification() {
        let identifier = "my-afternoon-notification"
        let title = "Prepara i rifiuti!"
        let body = "Scopri cosa smaltire oggi"
        let hour = 17
        let minute = 30
        let isDaily = true
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content .sound = .default
        
        let calendar = Calendar.current
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
    }
}


#Preview {
    ContentView()
}
