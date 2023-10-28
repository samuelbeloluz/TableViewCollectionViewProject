//
//  ProductCollectionViewCell.swift
//  TableView&CollectionView
//
//  Created by Samuel Montagnini on 27/10/23.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    //
    static var identifier: String = "ProductCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    //Lifecycle- awakeFromNib works as ViewDidLoad()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configBuyButton()
//        configProductImageView()
    }
    
    //Function to setup the cell and config the image ImageView will display.
    func setupCell(imageName: String) {
        //Setting ImageView image
        productImageView.image = UIImage(named: imageName)
        //setting ImageView ContentMode (how image is displayed)
        productImageView.contentMode = UIView.ContentMode.scaleAspectFit
        productImageView.clipsToBounds = true
    }
    
    func configBuyButton() {
        buyButton.tintColor = UIColor.white
        buyButton.backgroundColor = UIColor.systemBlue
        buyButton.setTitle("Buy", for: .normal)
        buyButton.layer.cornerRadius = 12
        buyButton.clipsToBounds = true
    }
    
    func configProductImageView() {
        productImageView.layer.borderWidth = 1
        productImageView.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
    }


}
