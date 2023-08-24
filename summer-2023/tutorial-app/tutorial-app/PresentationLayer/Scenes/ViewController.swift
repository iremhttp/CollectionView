import UIKit

final class ViewController: UIViewController {
    
    let customCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        initCollectionView()
    }
    
    private func prepareUI() {
        customCollectionView.backgroundColor = .black
        view.addSubview(customCollectionView)
        NSLayoutConstraint.activate([
            customCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            customCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func initCollectionView() {
        customCollectionView.delegate = self
        customCollectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath) as? CustomCollectionViewCell
        cell?.label.text = String(indexPath.item)
        cell?.sublabel.text = "sublabel index \(indexPath.item)"
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width / CGFloat(1) // Display 4 icons in a row
        return CGSize(width: itemWidth, height: 100) // Adjust height as needed
    }
    

}
