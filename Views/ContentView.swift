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
    @State private var isOnboardingCompleted = UserDefaults.standard.bool(forKey: "isOnboardingCompleted")
    
    init() {
        dispatchNotification()
        checkForPermission()
    }
    
    var body: some View {
        NavigationStack {
            if !isOnboardingCompleted {
                OnBoardingScreen(isOnboardingCompleted: $isOnboardingCompleted)
            } else {
                TabBarView()
            }
        }
    }
        
    func dispatchNotification() {
        let identifier = "my-afternoon-notification"
        let title = "TestPerApp"
        let body = "ProvaPippoPluto"
        let hour = 18
        let minute = 00
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
}


#Preview {
    ContentView()
}
