//
//  ViewController.swift
//  ListProds
//
//  Created by dam on 19/2/18.
//  Copyright © 2018 dam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewProt, UICollectionViewDelegate, UICollectionViewDataSource{
    
    //FIXME: ¿Cómo debería pasarle la interfaz que desde el presentador da ordenes a la vista?
//    private let presenter = ProdListPresenter(viewController: self)
    let presenter = ProdListPresenter()
    var products : [Product] = [];
    func setProds(_ prods: [Product]) {
        products = prods;
        print("SET PRODS : " + String(describing: products))
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(viewC: self)
        presenter.allProds()
        collectionViewProds.dataSource = self
        collectionViewProds.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let layout = self.collectionViewProds.collectionViewLayout as! UICollectionViewFlowLayout
        collectionViewProds.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.sectionInset = UIEdgeInsets(top: -5,left: 5,bottom: -5,right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionViewProds.frame.size.width )/2, height: self.collectionViewProds.frame.size.height/3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Collection view
    
    @IBOutlet weak var collectionViewProds: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewProds.dequeueReusableCell(withReuseIdentifier: "prodCell", for: indexPath) as! CollectionViewCell
        
        //Asigna el contenido al label de la celda
        cell.lblName.text = products[indexPath.item].product
        //Asigna las imagenes al imageView de la celda
        cell.lblId.text = products[indexPath.item].id
        
        //Borde
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        //Pinta la celda ya cargada
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        //Borde de selección
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        //Deseleccionar borde
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.5
    }
    
    
}

