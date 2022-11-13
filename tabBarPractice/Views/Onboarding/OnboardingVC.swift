//
//  OnboardingVC.swift
//  tabBarPractice
//
//  Created by Batuhan Demircioğlu on 10.11.2022.
//

import UIKit

class OnboardingVC: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                UIView.transition(with: nextButton,
                              duration: 0.1,
                               options: .transitionCrossDissolve,
                                  animations: {
                    self.nextButton.setTitle("Get Started", for: .normal)
                         }, completion: nil)
            }
            else {
                UIView.transition(with: nextButton,
                              duration: 0.1,
                               options: .transitionCrossDissolve,
                                  animations: {
                    self.nextButton.setTitle("Next", for: .normal)
                         }, completion: nil)
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        slides = [OnboardingSlide(title: "First Slide", description: "This is first slide's description", image: UIImage(named: "slide1")!),OnboardingSlide(title: "Second Slide", description: "This is second slide's description", image: UIImage(named: "slide2")!),OnboardingSlide(title: "Third slide", description: "This is third slide's description", image: UIImage(named: "slide3")!)]
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .coverVertical
            
            present(controller, animated: true)
            
        }
        else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  collectionView.frame.width - 7.5 , height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / (width - 50))
        
        
    }
    
    
    
}
