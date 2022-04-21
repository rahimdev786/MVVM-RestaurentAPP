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
        restaurentDetails.register(resturentDetailsCellTableViewCell.xibName, forCellReuseIdentifier: resturentDetailsCellTableViewCell.identifier)
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
        let cell = restaurentDetails.dequeueReusableCell(withIdentifier:resturentDetailsCellTableViewCell.identifier        , for: indexPath) as! resturentDetailsCellTableViewCell
        cell.celldata(withdata: viewModel.getdata.value[indexPath.row])
        return cell
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let celldata =  tableView.cellForRow(at: indexPath) as! resturentDetailsCellTableViewCell
      
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "mapController") as! mapController
        vc.logitute = celldata.logi
        vc.latitde = celldata.lat
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
