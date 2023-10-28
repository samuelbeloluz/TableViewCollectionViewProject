//
//  ProductTableViewCell.swift
//  TableView&CollectionView
//
//  Created by Samuel Montagnini on 27/10/23.
//

//MARK: Never change File or XIB name, it will crash the cell because UINib create a reference to the name the moment you click to create the cell.

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productContentView: UIView!
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    //Actual TableView Section
    var tableViewSection:Int?
    
    
    //Creating a cell identifier that need to have the same name as File's class.
    static var identifier: String = "ProductTableViewCell"
    
    //Identifing File's XIB.
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configProductCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //A function to receive data and setup the elements in TableViewCell.
    func setupCell(tableViewSection: Int) {
        self.tableViewSection = tableViewSection
    }
    
    func configProductCollectionView() {
        //Sign the CollectionView protocols to UITableViewCell take the responsability and use CollectionView properly.
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        //Setting the scroll direction to CollectionView
        if let layout = productCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
            layout.estimatedItemSize = CGSize.zero
        }
        
        //Registering the cell so CollectionView can use it.
        productCollectionView.register(ProductCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
    }
    
    
}

extension ProductTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: UICollectionView obligatory methods to use it: numberOfItemsInSection, cellForItemsAt.
    
    //Number of UICollectionViewCell in sections
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let productData: ProductData = ProductData()
        
        return productData.productList[section].products.count
    }
    //Pass the CollectionViewCell to CollectionView use it.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Instanciating the UICollectionViewCell so we can return it to the method. We use a CollectionView method that return a UICollectionView blank and we do a DownCast to a specific cell we want, in this case is ProductCollectionViewCell. DownCast make a opitional instance.
        let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell
        
        let productData: ProductData = ProductData()
        
        //Using setupCell method of our CollectionViewCell to send the Images it will display.
        cell?.setupCell(imageName: productData.productList[self.tableViewSection ?? 0].products[indexPath.row])
        
        //As cell is opitional due to DownCast, we pass a blank UICollectionViewCell to nil cases.
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 200)
    }
    
}
