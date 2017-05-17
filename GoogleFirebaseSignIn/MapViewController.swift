//
//  MapViewController.swift
//  GoogleFirebaseSignIn
//
//  Created by jlosurdo on 5/16/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, UIScrollViewDelegate
{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 10
        //scrollView.delegate = self
        //scrollView.addSubview(imageView)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
}
