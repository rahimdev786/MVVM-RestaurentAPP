//
//  Network Monitor.swift
//  MVVM-RestaurentAPP
//
//  Created by arshad on 4/21/22.
//

import Foundation
import Network


class NetworkMonitor
{
    static let shared:NetworkMonitor = NetworkMonitor()
    private init(){}
   
     var monitor:NWPathMonitor?
     var isMonitoring = false

    //Checking Status Of network in Applications
    var didStartMonitorNetwork:(()->(Void))?
    var didStopMonitorNetwork:(()->(Void))?
    var monitorNetworkStatus:(()->(Void))?

    //use it to check network is connected or not.
    var isConnected:Bool{
        guard let monitor = monitor else { return false }
        return monitor.currentPath.status == NWPath.Status.satisfied
    }

    private var avaliableInterfaceType:[NWInterface.InterfaceType]?{
        guard let monitor = monitor else { return nil }
        return monitor.currentPath.availableInterfaces.map({$0.type})
    }
    
    var interface:NWInterface.InterfaceType?{
        guard let _ = monitor else {return nil}
        return self.avaliableInterfaceType?.first
    }
    
    
    // call it first to start monitoring the network connection.
    func startMonitoring(){
        if isMonitoring {return}
    monitor = NWPathMonitor()
        
    //running in background Thread, because we are continiuously monitor network
        
        let queue = DispatchQueue(label: "Monitor")
        monitor?.start(queue: queue)
        monitor?.pathUpdateHandler = { _  in
            self.monitorNetworkStatus?()
        }
        isMonitoring = true
        didStartMonitorNetwork?()
    }
    
    
    func stopMonitor()
    {
 
        if isMonitoring , let monitor = monitor{
            monitor.cancel()
            self.monitor = nil
            isMonitoring = false
            didStopMonitorNetwork?()
        }
    }
    

    deinit {
        self.stopMonitor()
    }
}
