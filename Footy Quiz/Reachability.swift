//
//  InternetConnection.swift
//  Footy Quiz
//
//  Created by Sory Diarra on 15/05/2020.
//  Copyright © 2020 Sory Diarra. All rights reserved.
//

import Foundation
import SwiftUI
import Network
import UIKit


//struct alert: View {
//    let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
//    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
//        NSLog("The \"OK\" alert occured.")
//    }))
//    var body: some View {
//
//
//
//
//
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
//}


class internetConnection: UIViewController {
    @EnvironmentObject var game: GameState
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    @Published var connected = "default"
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    
    //func getConnection(){
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                //self.game.online = true
                self.connected = "yes"
                print("Connected")
            } else {
               let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                self.connected = "no"
                //self.game.online = false
                print("No connection")
            }
        }
        monitor.start(queue: queue)
    //}
    }
}
