//
//  ImageZoomViewController.swift
//  ScrollViewSample
//
//  Created by Chris Brandsma on 1/5/18.
//  Copyright © 2018 CSpace. All rights reserved.
//
//  Show how to implement an image zoom using UIScrollView and UIImageview

import Foundation
import UIKit

class ImageZoomViewController: UIViewController {
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    var imageViewTLC: LC!
    var imageViewBLC: LC!
    var imageViewRLC: LC!
    var imageViewLLC: LC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size)
    }
    
    func setup() {
        self.scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.bounces = false
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 100.0
        scrollView.autoresizesSubviews = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        
        self.view.addSubview(scrollView, withConstraints: LC.fill(ofView: scrollView, toView: self.view))
        
        self.imageView = UIImageView(image: Assets.boiseFireImage)
        imageView.contentMode = .scaleToFill
        imageView.isUserInteractionEnabled = true
        
        imageViewTLC = LC.top(ofView: imageView, toView: scrollView)
        imageViewBLC = LC.bottom(ofView: imageView, toView: scrollView)
        imageViewLLC = LC.left(ofView: imageView, toView: scrollView)
        imageViewRLC = LC.right(ofView: imageView, toView: scrollView)

        scrollView.addSubview(imageView, withConstraints: [imageViewRLC, imageViewLLC, imageViewBLC, imageViewTLC])
        
        self.scrollView.contentSize = self.imageView.bounds.size
        
        let vScale = self.imageView.bounds.size.height / self.view.frame.size.height
        let hScale = self.imageView.bounds.size.width / self.view.frame.size.width
        self.scrollView.zoomScale = max(vScale, hScale)
    }
    
    private func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.zoomScale = minScale
    }
}

extension ImageZoomViewController: UIScrollViewDelegate {
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintsForSize(view.bounds.size)
    }
    
    private func updateConstraintsForSize(_ size: CGSize) {
        let yOffset = max(0, (size.height - imageView.frame.height) / 2)
        imageViewTLC.constant = yOffset
        imageViewBLC.constant = yOffset
        
        let xOffset = max(0, (size.width - imageView.frame.width) / 2)
        imageViewLLC.constant = xOffset
        imageViewRLC.constant = xOffset
        
        view.layoutIfNeeded()
    }
    
    // NOTE: this is ALMOST the most imporant part of this file.
    // Without this function implemented, no zoom.
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

}
