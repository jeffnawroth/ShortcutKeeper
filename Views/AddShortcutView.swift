//
//  AddShortcutView.swift
//  ShortcutKeeper
//
//  Created by Jeff Nawroth on 23.12.23.
//

import Foundation
import SwiftUI
import ShortcutRecorder

extension AddShortcutView: ShortcutRecorderDelegate {
    func didChangeShortcut(_ newShortcut: Shortcut) {
        self.keyCombination = newShortcut
        switchToNextInputField()
    }
}

struct AddShortcutView: View {
    
    @ObservedObject var viewModel: ShortcutsViewModel
    
    enum InputField {
        case keyCombination, appName, description
    }
    
    @State private var currentInput = InputField.appName
    @State private var keyCombination: Shortcut? = Shortcut(keyEquivalent: "")
    @State private var appName = ""
    @State private var description = ""
    
    var body: some View {
        Group {
            if(currentInput == .appName) {
                TextField("Anwendung", text: $appName)
                    .onSubmit {
                        switchToNextInputField()
                    }
            } else if (currentInput == .description) {
                TextField("Beschreibung", text: $description)
                    .onSubmit {
                        switchToNextInputField()
                    }
            } else if (currentInput == .keyCombination) {
                ShortcutRecorderView(shortcut: $keyCombination, delegate: self)
                
            }
        }.padding([.top, .horizontal])
        
        
        //        TextField(placeholderForCurrentInput(), text: bindingForCurrentInput())
        //            .padding([.horizontal, .top])
        //            .onSubmit {
        //                switchToNextInputField()
        //            }
        //            .onDisappear {
        //                resetInputFields()
        //            }
        //            .textFieldStyle(.plain)
    }
    
    //    private func placeholderForCurrentInput() -> String {
    //        switch currentInput {
    //        case .keyCombination:
    //            return "Tastenkombination"
    //        case .appName:
    //            return "App-Name"
    //        case .description:
    //            return "Beschreibung"
    //        }
    //    }
    
    //    private func bindingForCurrentInput() -> Binding<String> {
    //        switch currentInput {
    //        case .keyCombination:
    //            return $keyCombination
    //        case .appName:
    //            return $appName
    //        case .description:
    //            return $description
    //        }
    //    }
    
    private func switchToNextInputField() {
        switch currentInput {
        case .appName:
            currentInput = .description
        case .description:
            currentInput = .keyCombination
        case .keyCombination:
            viewModel.addShortcut(keyCombination: keyCombination!, appName: appName, description: description)
            resetInputFields()
        }
    }
    
    private func resetInputFields() {
        keyCombination = Shortcut(keyEquivalent: "")
        appName = ""
        description = ""
        currentInput = .appName
    }
}

#Preview {
    ContentView()
}

