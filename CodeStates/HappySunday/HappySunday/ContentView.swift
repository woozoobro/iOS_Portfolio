//
//  LeeoView.swift
//  HappySunday
//
//  Created by 우주형 on 2023/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TouchView()
            .frame(width: 300, height: 300)
            .background(.green)
    }
}

struct TapView: UIViewRepresentable {

    var tappedCallback: (UITouch, CGPoint?) -> Void

    func makeUIView(context: UIViewRepresentableContext<TapView>) -> TapView.UIViewType {
        let v = UIView(frame: .zero)
        let gesture = CustomFingerGestureRecognizer(target: context.coordinator, tappedCallback: tappedCallback)
        v.addGestureRecognizer(gesture)
        return v
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<TapView>) {
        // empty
    }

}

class CustomFingerGestureRecognizer: UIGestureRecognizer {

    var tappedCallback: (UITouch, CGPoint?) -> Void

    var touchViews = [UITouch:CGPoint]()

    init(target: Any?, tappedCallback: @escaping (UITouch, CGPoint?) -> ()) {
        self.tappedCallback = tappedCallback
        super.init(target: target, action: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        for touch in touches {
            let location = touch.location(in: touch.view)
            touchViews[touch] = location
            tappedCallback(touch, location)
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        for touch in touches {
            let newLocation = touch.location(in: touch.view)
            touchViews[touch] = newLocation
            tappedCallback(touch, newLocation)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        for touch in touches {
            touchViews.removeValue(forKey: touch)
            tappedCallback(touch, nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SampleTouchView: UIViewRepresentable {
    func makeUIView(context: Context) -> TouchableView {
        let touchableView = TouchableView(frame: .zero)
        return touchableView
    }
    
    func updateUIView(_ uiView: TouchableView, context: Context) {
        
    }
    
    typealias UIViewType = TouchableView
}


struct TouchView: UIViewRepresentable {
    func makeUIView(context: Context) -> TouchableView {
        let touchableView = TouchableView(frame: .zero)
        return touchableView
    }
    
    func updateUIView(_ uiView: TouchableView, context: Context) {
        
    }
    
    typealias UIViewType = TouchableView
}


class TouchSpotView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Update the corner radius when the bounds change.
    override var bounds: CGRect {
        get { return super.bounds }
        set(newBounds) {
            super.bounds = newBounds
            layer.cornerRadius = newBounds.size.width / 2.0
        }
    }
}

class TouchableView: UIView {
    var touchViews = [UITouch:TouchSpotView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isMultipleTouchEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        isMultipleTouchEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            createViewForTouch(touch: touch)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = viewForTouch(touch: touch)
            // Move the view to the new location.
            let newLocation = touch.location(in: self)
            view?.center = newLocation
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            removeViewForTouch(touch: touch)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            removeViewForTouch(touch: touch)
        }
    }
    
    // Other methods. . .
    func createViewForTouch( touch : UITouch ) {
        let newView = TouchSpotView()
        newView.bounds = CGRect(x: 0, y: 0, width: 1, height: 1)
        newView.center = touch.location(in: self)
        
        // Add the view and animate it to a new size.
        addSubview(newView)
        UIView.animate(withDuration: 0.2) {
            newView.bounds.size = CGSize(width: 100, height: 100)
        }
        
        // Save the views internally
        touchViews[touch] = newView
    }
    
    func viewForTouch (touch : UITouch) -> TouchSpotView? {
        return touchViews[touch]
    }
    
    func removeViewForTouch (touch : UITouch ) {
        if let view = touchViews[touch] {
            view.removeFromSuperview()
            touchViews.removeValue(forKey: touch)
        }
    }
}
