//
//  ViewController.swift
//  TempSparrow24_02_16
//
//  Created by Egor Ledkov on 16.02.2024.
//

import UIKit

class ViewController: UIViewController {

	private lazy var jumpingView: UIView = makeView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		view.addSubview(jumpingView)
		
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
		view.addGestureRecognizer(tapGesture)
	}
	
	@objc private func handleTap(gesture: UITapGestureRecognizer) {
		let location = gesture.location(in: view)
		
		let angle = location.x < jumpingView.center.x ? -0.3 : 0.3
		
		UIView.animate(
			withDuration: 0.5,
			delay: 0,
			usingSpringWithDamping: 0.6,
			initialSpringVelocity: 0.5,
			options: .curveEaseInOut
		) {
			self.jumpingView.center = location
			self.jumpingView.transform = CGAffineTransform(rotationAngle: angle)
		}
		
		UIView.animate(
			withDuration: 0.25,
			delay: 0.25,
			usingSpringWithDamping: 0.6,
			initialSpringVelocity: 0.5,
			options: .curveEaseInOut
		) {
			self.jumpingView.transform = CGAffineTransform.identity
		}
	}
	
	private func makeView() -> UIView {
		let frame = CGRect(
			x: self.view.frame.midX - 50,
			y: self.view.frame.midY - 50,
			width: 100,
			height: 100
		)
		
		let view = UIView(frame: frame)
		view.backgroundColor = .tintColor
		view.layer.cornerRadius = 10
		
		return view
	}
}
