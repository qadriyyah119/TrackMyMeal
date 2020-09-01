//
//  DashboardViewController.swift
//  TrackMyMeal
//
//  Created by Qadriyyah Griffin on 8/25/20.
//  Copyright © 2020 Qadriyyah Thomas. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
  
  @IBOutlet weak var backgroundImageView: UIImageView!
  
  let shapeLayer = CAShapeLayer()
  
  let percentageLabel: UILabel = {
    let label = UILabel()
    label.text = "Start"
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 32)
    return label
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
      
      backgroundImageView.image = #imageLiteral(resourceName: "dashboard2")
      
      view.addSubview(percentageLabel)
      percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
      percentageLabel.center = view.center
      
      let trackLayer = CAShapeLayer()
      // create circle
      let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
      
      trackLayer.path = circularPath.cgPath
      
      trackLayer.strokeColor = Theme.accentColor?.cgColor
      trackLayer.fillColor = Theme.backgroundColor?.cgColor
      trackLayer.lineWidth = 10
      trackLayer.lineCap = CAShapeLayerLineCap.round
      trackLayer.position = view.center
      view.layer.addSublayer(trackLayer)
      
      shapeLayer.path = circularPath.cgPath
      
      shapeLayer.strokeColor = Theme.tintColor?.cgColor
      shapeLayer.fillColor = Theme.backgroundColor?.cgColor
      shapeLayer.lineWidth = 10
      shapeLayer.lineCap = CAShapeLayerLineCap.round
      shapeLayer.position = view.center
      
      shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
      
      shapeLayer.strokeEnd = 0
      
      view.layer.addSublayer(shapeLayer)
      
      view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))


    }
  
  fileprivate func animateCircle() {
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    
    basicAnimation.toValue = 1
    basicAnimation.duration = 2
    basicAnimation.fillMode = CAMediaTimingFillMode.forwards
    basicAnimation.isRemovedOnCompletion = false
    
    shapeLayer.add(basicAnimation, forKey: "urSoBasic")
  }
  
  @objc private func handleTap() {
    print("attempting to animate stroke")
    
    animateCircle()
  }

}
