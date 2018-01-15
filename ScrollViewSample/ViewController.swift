//
//  ViewController.swift
//  ScrollViewSample
//
//  Created by Chris Brandsma on 1/5/18.
//  Copyright © 2018 CSpace. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView!
    
    let list: [MainModel] = [
        MainModel(title: "Image Zoom", action: #selector(ViewController.imageZoomView)),
        MainModel(title: "Scroll Multiple", action: #selector(ViewController.scrollMultipleSample)),
        MainModel(title: "Mixed Content TableView", action: #selector(ViewController.mixedTableView)),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setup(){
        self.tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isUserInteractionEnabled = true
        
        self.view.addSubview(tableView, withConstraints: LC.fill(ofView: tableView, toView: self.view))
        
    }
    
    @objc func imageZoomView() {
        let vc = ImageZoomViewController()
        CSViewLoader.navTo.display("ImageZoom", vc)
    }
    
    @objc func scrollMultipleSample() {
        let vc = ScrollMultipleViewController()
        CSViewLoader.navTo.display("ScrollMultiple", vc)
    }
    
    @objc func mixedTableView() {
        let vc = MixedContentViewController()
        CSViewLoader.navTo.display("MixedTableView", vc)
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = list[indexPath.row]
        perform(model.action)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        let model = list[indexPath.row]
        cell.textLabel?.text = model.title
        return cell
    }
}

struct MainModel {
    var title: String
    var action: Selector
}
