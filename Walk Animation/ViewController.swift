//
//  ViewController.swift
//  Walk Animation
//
//  Created by Toby Delgado Ramos on 10/13/22.
//

import UIKit

enum moveDirection {
case n, s, e, w
}

class ViewController: UIViewController {
    
    let myNewView = UIView(frame: CGRect(x: 10.0, y: 100.0, width: 100.0, height: 100.0))
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var walkImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUIView()
    }
    
    @IBAction func nTapped(_ sender: UIButton) {
        moveUIView(whatView: firstView, direction: .n, speed: 40)
    }
    
    @IBAction func sTapped(_ sender: UIButton) {
        moveUIView(whatView: firstView, direction: .s, speed: 40)
    }
    
    @IBAction func eTapped(_ sender: UIButton) {
        moveUIView(whatView: firstView, direction: .e, speed: 40)
    }
    
    @IBAction func wTapped(_ sender: UIButton) {
        moveUIView(whatView: firstView, direction: .w, speed: 40)
    }
    
    func makeUIView() {
        myNewView.backgroundColor = UIColor.lightGray
        myNewView.layer.cornerRadius = 25
        myNewView.layer.borderWidth = 2
        myNewView.layer.borderColor = UIColor.red.cgColor
        self.view.addSubview(myNewView)
    }
    
    func checkCollide(){
        if myNewView.frame.intersects(myNewView.convert(firstView.frame, from: firstView)) {
            randoMove(whatView: myNewView)
        }
    }
    
    func randoMove(whatView: UIView) {
        let xR = CGFloat.random(in: -25.0...390.0)
        let yR = CGFloat.random(in: 0.0...880.0)
        whatView.frame.origin.x = xR
        whatView.frame.origin.y = yR
    }
    
    func moveUIView(whatView: UIView, direction: moveDirection, speed: CGFloat) {
        var xMove: CGFloat = 0.0
        var yMove: CGFloat = 0.0
        switch direction {
        case .n:
            yMove -= speed
        case .s:
            yMove += speed
        case .e:
            xMove += speed
        case .w:
            xMove -= speed
        }
        UIView.animate(withDuration: 0.1){
            whatView.frame.origin.y += yMove / 3
            whatView.frame.origin.x += xMove / 3
            self.walkImage.image = UIImage(named: "southRight")
        } completion: { _ in
            UIView.animate(withDuration: 0.1){
                whatView.frame.origin.y += yMove / 3
                whatView.frame.origin.x += xMove / 3
                self.walkImage.image = UIImage(named: "southLeft")
            } completion: { _ in
                UIView.animate(withDuration: 0.1){
                    whatView.frame.origin.y += yMove / 3
                    whatView.frame.origin.x += xMove / 3
                    self.walkImage.image = UIImage(named: "southStand")
                }
            }
        }
        checkCollide()
    }
    
}

