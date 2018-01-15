//
//  ScrollMultipleViewController.swift
//  ScrollViewSample
//
//  Created by Chris Brandsma on 1/6/18.
//  Copyright © 2018 CSpace. All rights reserved.
//
//  Show scrolling with multiple controlls in ScrollView
//  ScrollView will scroll vertically only
//  Layout happens mostly with autolayout

import Foundation
import UIKit

class ScrollMultipleViewController: UIViewController {
    var scrollView: UIScrollView!
    var label: UILabel!
    
    let longText = """
Bacon ipsum dolor amet salami sausage pastrami burgdoggen doner cow ham hock leberkas shoulder jerky pancetta porchetta shank tri-tip.
Doner sausage chuck, pork meatloaf leberkas bresaola short ribs filet mignon turducken salami pancetta drumstick. Cow tenderloin capicola sausage,
drumstick turducken doner swine chicken venison. Bresaola meatball buffalo prosciutto pancetta t-bone pork loin kielbasa chuck pastrami kevin.
Bacon ipsum dolor amet salami sausage pastrami burgdoggen doner cow ham hock leberkas shoulder jerky pancetta porchetta shank tri-tip.
Doner sausage chuck, pork meatloaf leberkas bresaola short ribs filet mignon turducken salami pancetta drumstick. Cow tenderloin capicola sausage,
drumstick turducken doner swine chicken venison. Bresaola meatball buffalo prosciutto pancetta t-bone pork loin kielbasa chuck pastrami kevin.
Bacon ipsum dolor amet salami sausage pastrami burgdoggen doner cow ham hock leberkas shoulder jerky pancetta porchetta shank tri-tip.
Doner sausage chuck, pork meatloaf leberkas bresaola short ribs filet mignon turducken salami pancetta drumstick. Cow tenderloin capicola sausage,
drumstick turducken doner swine chicken venison. Bresaola meatball buffalo prosciutto pancetta t-bone pork loin kielbasa chuck pastrami kevin.
Bacon ipsum dolor amet salami sausage pastrami burgdoggen doner cow ham hock leberkas shoulder jerky pancetta porchetta shank tri-tip.
Doner sausage chuck, pork meatloaf leberkas bresaola short ribs filet mignon turducken salami pancetta drumstick. Cow tenderloin capicola sausage,
drumstick turducken doner swine chicken venison. Bresaola meatball buffalo prosciutto pancetta t-bone pork loin kielbasa chuck pastrami kevin.
"""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        self.scrollView = UIScrollView()
    }
}
