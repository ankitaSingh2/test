//
//  ViewController.swift
//  FacialImage
//
//  Created by Ankita on 10/06/20.
//  Copyright © 2020 Ankita. All rights reserved.
//

import UIKit
import SIFaceCaptureSDK

class ViewController: UIViewController {
    @IBOutlet weak var imageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        SIFacialHandler.shared.doTakePicture(viewController: self){ (imageQuality) in
////            //let cropZone = CGRect(x:712,
////                                  y:1200,
////                                  width:1800,
////                                  height:2050)
//            let cropZone = CGRect(x:130,
//            y:230,
//            width:330,
//            height:400)
//
//            // Perform cropping in Core Graphics
//            let tempSelfieImage = imageQuality?.capturedImage
//            guard let cutImageRef: CGImage = tempSelfieImage?.cgImage?.cropping(to:cropZone)
//                else {
//                    return
//            }
//            // Return image to UIImage
//            let croppedImage: UIImage = UIImage(cgImage: cutImageRef)
//            self.imageview.image = croppedImage
//        }
//    }
        
        SIFacialHandler.shared.openPicker { (resull) in
          print(resull)
        }
        
//        SIFacialHandler.shared.openPicker { (result) in
//            print(result)
//        }
        
    }

}

