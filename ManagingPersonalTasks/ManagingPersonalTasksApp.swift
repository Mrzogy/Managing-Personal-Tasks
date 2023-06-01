//
//  ManagingPersonalTasksApp.swift
//  ManagingPersonalTasks
//
//  Created by 3bood on 12/11/1444 AH.
//

import SwiftUI

@main
struct ManagingPersonalTasksApp: App {
    
    @StateObject var listViewModel: ListViewMdel = ListViewMdel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
