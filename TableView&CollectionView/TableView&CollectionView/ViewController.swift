//
//  ViewController.swift
//  TableView&CollectionView
//
//  Created by Samuel Montagnini on 27/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    
    @IBOutlet weak var productTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configProductTableView()
        configTitleNavigationItem()
    }
    
    func configProductTableView() {
        //Sign the protocols to use TableView correctly and pass responsability to ViewController.
        productTableView.delegate = self
        productTableView.dataSource = self
        //Registering the TableViewCell in TableView so it can use it. To make it, we pass the nib() that identify XIB and File identifier of the XIB.
        productTableView.register(ProductTableViewCell.nib(), forCellReuseIdentifier: ProductTableViewCell.identifier)
    }
    
    func configTitleNavigationItem(){
        titleNavigationItem.title = "AutoShop"
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Instanciating the Cell, and making a downCast so the generic cell created by the TableView method be a instance of specific cell class, the ProductTableViewCell in this case.
        let cell = productTableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell
        
        //Calling the setupCell method to pass the tableView actual Section to the cell set the correct CollectionView.
        cell?.setupCell(tableViewSection: indexPath.section)
        
        //As cell is opitional because the DownCast process, we treat the opinial case passing a blank UITableViewCell.
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let productData: ProductData = ProductData()
        return productData.productList[section].sectionTitle
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let productData: ProductData = ProductData()
        
        return productData.countProducts()
    }
    
}
