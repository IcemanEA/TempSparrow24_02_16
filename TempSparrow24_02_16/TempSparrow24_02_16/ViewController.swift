//
//  ViewController.swift
//  TempSparrow24_02_16
//
//  Created by Egor Ledkov on 21.02.2024.
//

import UIKit

final class ViewController: UIViewController {
	
	private let squareView = UIView()
	
	private var animator: UIDynamicAnimator?
	private var snapBehavior: UISnapBehavior?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		view.addSubview(squareView)
		squareView.backgroundColor = .systemBlue
		squareView.layer.cornerCurve = .continuous
		squareView.layer.cornerRadius = 8
		squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		squareView.center = CGPoint(x: view.frame.midX, y: view.frame.midY)
		
		animator = UIDynamicAnimator(referenceView: view)
		
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
		view.addGestureRecognizer(tapGesture)
	}
	
	@objc private func handleTap(sender: UITapGestureRecognizer) {
		let tapPoint =  sender.location(in: view)
		
		if let snapBehavior = self.snapBehavior {
			animator?.removeBehavior(snapBehavior)
		}
		
		let snapBehavior = UISnapBehavior(item: squareView, snapTo: tapPoint)
		snapBehavior.damping = 0.9
		animator?.addBehavior(snapBehavior)
		
		self.snapBehavior = snapBehavior
	}
}
