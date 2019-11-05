# StateButton

A subclass of UIButton to deal with state change

the core property, states, is a list of:

       
```    
struct ButtonState {
        let action: ()->Void
        let image: UIImage?
        let tintColor:UIColor?
        let info:Any?
        let title:String?
        init(action: @escaping ()->Void, title:String? = nil, image: UIImage? ,tintColor:UIColor? = nil, info:Any? = nil) {
            self.action = action
            self.image = image
            self.tintColor = tintColor
            self.info = info
            self.title = title
        }
    }
```
action: the block of what to do when the state is activated

image: the image for the state

tintColor: optional, the tint color for the image

info: optional, the additional information for the state

title: optional, the button title for the state

Other property:

stateChangeMinGap: the minimum time gap for state change, probably triggered by uibutton, default 1s


Example under a view controller:
```
let stateButton = ...

stateButton.states = [
            RSMapButton.ButtonState(action: { [weak self] in
                //action state 1 activated
                }, image: UIImage(named: "img for state 1")),
            RSMapButton.ButtonState(action: { [weak self] in
                //state 2 activated
                }, image: UIImage(named: "img for state 1"), tintColor: UIColor.blue),
            RSMapButton.ButtonState(action: { [weak self] in
                //state 3 activated
                }, image: UIImage(named: "img for state 3")),
            ]
```
