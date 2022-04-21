//
//  ViewController.swift
//  MVVM-RestaurentAPP
//
//  Created by arshad on 4/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = RestaturentViewModel()
    
    @IBOutlet weak var restaurentDetails:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.callAPI()
        restaurentDetails.register(UITableViewCell.self, forCellReuseIdentifier: "celldata")
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //View Model binding here
        viewModel.getdata.bind { _ in
            DispatchQueue.main.async {
                self.restaurentDetails.reloadData()
            }
        }
    }
}


extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getdata.value.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = restaurentDetails.dequeueReusableCell(withIdentifier: "celldata", for: indexPath)
        cell.textLabel?.text = viewModel.getdata.value[indexPath.row].contact?.facebookName
        return cell
    }
}
