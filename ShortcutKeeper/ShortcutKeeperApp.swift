//
//  ShortcutKeeperApp.swift
//  ShortcutKeeper
//
//  Created by Jeff Nawroth on 22.12.23.
//

import SwiftUI

@main
struct ShortcutKeeperApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    static private(set) var instance: AppDelegate!
    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = ApplicationMenu()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        statusBarItem.button?.image = NSImage(named: NSImage.Name("shortcut"))
        statusBarItem.button?.imagePosition = .imageLeading
        statusBarItem.menu = menu.createMenu()
        
    }
}

//class AppDelegate: NSObject, NSApplicationDelegate {
//    private var statusItem: NSStatusItem!
//    private var popover: NSPopover!
//    let menu = ApplicationMenu()
//
//
//    func applicationDidFinishLaunching(_ notification: Notification) {
//
//        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
//
//        if let statusButton = statusItem.button {
//            statusButton.image = NSImage(systemSymbolName: "chart.line.uptrend.xyaxis.circle", accessibilityDescription: "Chart Line")
//            statusButton.action = #selector(togglePopover)
//        }
//
//        statusItem.menu = menu.createMenu()
//
//
//        self.popover = NSPopover ( )
//        self.popover.contentSize = NSSize(width: 200, height: 200)
//        self.popover.behavior = . transient
//        self.popover.contentViewController = NSHostingController(rootView: ContentView())
//
//
//    }
//
//    @objc func togglePopover(){
//        if let button = statusItem.button {
//            if popover.isShown {
//                self.popover.performClose(nil)
//            } else {
//                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
//            }
//        }
//    }
//}
