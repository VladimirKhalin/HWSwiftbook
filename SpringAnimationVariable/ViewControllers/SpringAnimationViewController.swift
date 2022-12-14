//
//  ViewController.swift
//  SpringAnimationVariable
//
//  Created by Vladimir Khalin on 14.12.2022.
//
import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    @IBOutlet var animationSpringView: SpringImageView!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var infoAnimationLabels: [SpringLabel]!
    @IBOutlet var stackInfoLabels: UIStackView!
    
    private var animation: Animation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationSpringView.layer.cornerRadius = 20
        startButton.layer.cornerRadius = 20
        animationSpringView.addSubview(stackInfoLabels)
        
        makeAnimation()
        enterInfoToLabels()
    }
    
    @IBAction func startAnimationButtonPr() {
        animationSpringView.animation = animation.preset
        animationSpringView.curve = animation.curve
        animationSpringView.force = animation.force
        animationSpringView.duration = animation.duration
        animationSpringView.delay = animation.delay
        animationSpringView.animate()
        
        enterInfoToLabels()
        makeAnimation()
        
        startButton.setTitle("Next: \(animation.preset)", for: .normal)
    }
    
    private func makeAnimation() {
        guard let preset = AnimationPreset.allCases.randomElement() else { return }
        guard let curve = AnimationCurve.allCases.randomElement() else {return }
        let force = isRandomDouble()
        let duration = isRandomDouble()
        let delay = isRandomDouble()
        
        animation = Animation(preset: preset.rawValue, curve: curve.rawValue, force: force, duration: duration, delay: delay)
    }
    
    private func isRandomDouble() -> Double {
        let doubleNumber = (Double.random(in: 0...3)*100).rounded()/100
        return doubleNumber
    }
    
    private func enterInfoToLabels() {
        for lable in 0..<infoAnimationLabels.count {
            switch lable {
            case 0: infoAnimationLabels[lable].text = "Preset: \(animation.preset)"
            case 1: infoAnimationLabels[lable].text = "Curve: \(animation.curve)"
            case 2: infoAnimationLabels[lable].text = "Force: \(animation.force)"
            case 3: infoAnimationLabels[lable].text = "Duration: \(animation.duration)"
            default: infoAnimationLabels[lable].text = "Delay: \(animation.delay)"
            }
        }
    }
}

