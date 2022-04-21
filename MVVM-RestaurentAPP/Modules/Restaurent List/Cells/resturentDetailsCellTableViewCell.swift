//
//  resturentDetailsCellTableViewCell.swift
//  MVVM-RestaurentAPP
//
//  Created by arshad on 4/21/22.
//

import UIKit
import SDWebImage

class resturentDetailsCellTableViewCell: UITableViewCell {

    
   static let identifier = "resturentDetailsCellTableViewCell"
   static let xibName = UINib(nibName: "resturentDetailsCellTableViewCell", bundle: nil)
    
    var lat:String = ""
    var logi:String = ""
    
    
    @IBOutlet weak var RestaurentName:UILabel!{
        didSet{
            self.RestaurentName.textColor = .blue
        }
    }
    @IBOutlet weak var RestaurentCity:UILabel!
    @IBOutlet weak var RestaurentState:UILabel!
    @IBOutlet weak var RestaurentAddress:UILabel!
    @IBOutlet weak var RestaurentType:UILabel!{
        didSet{
            self.RestaurentType.textColor = .red
        }
    }
    @IBOutlet weak var RestaurentImage:UIImageView!{
        didSet{
            self.RestaurentImage.layer.cornerRadius = 15
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func celldata(withdata data:Restaurant){
        self.RestaurentName.text = data.name
        self.RestaurentType.text = data.category
        self.RestaurentAddress.text = data.location.address
        self.RestaurentCity.text = data.location.city.rawValue
        self.RestaurentState.text = data.location.state.rawValue
        if let url = URL(string: data.backgroundImageURL){
                self.RestaurentImage.sd_setImage(with: url)
            }
        self.lat = String(describing:data.location.lat )
        self.logi = String(describing:data.location.lng )
    }
    
}
