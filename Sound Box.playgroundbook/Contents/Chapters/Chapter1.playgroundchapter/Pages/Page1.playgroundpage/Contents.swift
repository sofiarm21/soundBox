/*:

This is the WWDC18 Scholarship application made by Sofia Rodriguez
 
Thanks to Apple for considering me
 
I hope you enjoy this PlaygroundBook
 
**Welcome to the Sound Box!**
 
 Here you can create engaging sounds, experiment with the gravity and the figures and see how it affects your melody.
 The rectangles are the drums, the circles are the bass, and the triangles and pentagons are the lead.
 Select a shape, add it to the box, and it will start bouncing.
 
Now it's time for you to play!
 * Set the `dy` [coordinate](glossary://coordinate)  to change the [gravitational force](glossary://gravitationalForce)
 * Set the [restitution](glossary://restitution) of each shape
 * Add the shapes to the box by tapping over them
 * In order to restart the game tap the restart button in the corner down on the right
 * You can impulse the figure just tapping over it
 
 Experiment with gravity to achieve fun and different sounds
 
 Have fun! 😋
 
 
 * callout(Hint):
 If you set the [`dy`](glossary://dy) to -10 you will simulate the gravity of the earth, if you put it positive the figures will rise.
 
 */
//#-hidden-code


import PlaygroundSupport
import SpriteKit
import UIKit



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    struct PhysicsCategories{
        
        static let base : UInt32 = 0b100000
        static let rectangle : UInt32 = 0b10
        static let circle : UInt32 = 0b100
        static let triangle : UInt32 = 0b1000
        static let polygon : UInt32 = 0b10000
        
    }
    
    //////////////////LOGIC/////////////////
    
    
    var positions  : [CGFloat] = []
    
    func fillPositions() -> [CGFloat]{
        let lenght = (CountableRange(0...(Int(CGFloat(frame.size.width)))))
        var counterOfWidthNumbers : CGFloat  = 0
        for _ in lenght{
            if positions.contains(counterOfWidthNumbers){
                
            }else{
                
                positions.append(counterOfWidthNumbers)
            }
            counterOfWidthNumbers += 1
        }
        let delPos = (Int(frame.size.width / 6))
        var count = 0
        var delPosMinus = 0
        for _ in lenght{
            for _ in 1...delPos - delPosMinus{
                if count == 6{
                    
                    
                    break
                }else{
                    
                    positions.remove(at: count)
                }
            }
            if count == 6{
                
                break
            }else{
                count += 1
                delPosMinus = 1
            }
            
        }
        
        return positions
    }
    
    
    
    func AssignPosition () -> CGFloat{
        var position: CGFloat = 0
        if positions.count >= 0{
            let selectPosition = (Int(arc4random_uniform(UInt32(positions.endIndex - 1))))
            position = positions[selectPosition]
            positions.remove(at: selectPosition)
        }else{
            /////ALARM
        }
        return position
    }
    
    
    var rectangleCounter = 0
    var circleCounter = 0
    var triangleCounter = 0
    var polygonCounter = 0
    
    func restartGame(){
        
        while rectangleCounter != 0{
            childNode(withName: "copiedRectangle")?.removeFromParent()
            rectangleCounter -= 1
            print("restarting rect...")
        }
        while circleCounter != 0 {
            childNode(withName: "copiedCircle")?.removeFromParent()
            print("restarting circle...")
            circleCounter -= 1
        }
        
        while triangleCounter != 0 {
            childNode(withName: "copiedTriangle")?.removeFromParent()
            print("restarting triang...")
            triangleCounter -= 1
        }
        
        while polygonCounter != 0 {
            childNode(withName: "copiedPolygon")?.removeFromParent()
            print("restarting polygn...")
            polygonCounter -= 1
        }
        
        fillPositions()
        
    }
    
    
    var theGameIsFull = false
    
    func showAlert(on scene: SKScene, title: String, message:String, preferredStyle: UIAlertControllerStyle, actions:[UIAlertAction], animated: Bool, completion: (() -> Swift.Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        for action in actions{
            alert.addAction(action)
        }
        
        view?.window?.rootViewController?.present(alert, animated: animated, completion: completion)
    }
    
    func showAlertNow(){
        let okAction = UIAlertAction(title: "ok", style: .default) { (result) in self.theGameIsFull = true}
        showAlert(on: self, title: "the game is full", message: "please restart to play again", preferredStyle: .alert, actions: [okAction], animated: true){
            print("showed alert")
        }
        
    }
    
    
    
    
    func createGravity(dx dxnum:Int, dy dynum:Int) -> (Int, Int){
        
        dx = (Int(arc4random_uniform(6)))
        dy = (Int(arc4random_uniform(6)))
        dx = dx - 3
        dy = dy - 3
        
        if dx == 0 && dy == 0{
            dx = 0
            dy = -10
        }
        
        print("The gravity is x:\(dx) y:\(dy)")
        
        return (dx, dy)
    }
    
    ///////////////RESTITUITION//////////
    
    var rectangleRestitution : CGFloat = 0
    var circleRestitution : CGFloat = 0
    var triangleRestitution : CGFloat = 0
    var pentagonRestitution : CGFloat = 0
    
    /////////////////////NODES//////////////////
    
    let rectangle = SKSpriteNode(imageNamed:"Rectangle.png")
    let circle = SKSpriteNode(imageNamed: "Oval.png")
    let triangle = SKSpriteNode(imageNamed: "Triangle.png")
    let polygon = SKSpriteNode(imageNamed: "Polygon.png")
    
    let restartBtn = SKSpriteNode(imageNamed: "restartBtn.png")
    
    
    
    
    let base = SKSpriteNode()
    let baseUp = SKSpriteNode()
    let baseLeft = SKSpriteNode()
    let baseRight = SKSpriteNode()
    
    var dx = 0
    var dy = -10
    
 

  
    
    
    
    ///////////////////////////////////////////////////////////////DID MOVE////////////////////////////////////////////
    
    override func didMove(to view: SKView) {
        
        
        physicsWorld.contactDelegate = self
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        fillPositions()
//#-end-hidden-code
//#-code-completion(everything, hide)

dy = (/*#-editable-code*/<#T##-10##Int#>/*#-end-editable-code*/)
        
 /*
Now set the bounciness of the shapes, remember it has to be a number between 0.0 and 1.0
 */
        
rectangleRestitution = (/*#-editable-code*/<#T##1##CGFloat#>/*#-end-editable-code*/)
circleRestitution = (/*#-editable-code*/<#T##1##CGFloat#>/*#-end-editable-code*/)
triangleRestitution = (/*#-editable-code*/<#T##1##CGFloat#>/*#-end-editable-code*/)
pentagonRestitution = (/*#-editable-code*/<#T##1##CGFloat#>/*#-end-editable-code*/)
        
         //#-hidden-code
        
        if rectangleRestitution > 1 || rectangleRestitution < 0 {
            rectangleRestitution = 1
        }
        
        if circleRestitution > 1 || circleRestitution < 0 {
            circleRestitution = 1
        }
        
        if triangleRestitution > 1 || triangleRestitution < 0 {
           triangleRestitution = 1
        }
        
        if pentagonRestitution > 1 || pentagonRestitution < 0 {
            pentagonRestitution = 1
        }
        

        
        physicsWorld.gravity = CGVector(dx: dx, dy: dy)
        
        
        //////CONFIGURING NODES
        
        
        rectangle.size = CGSize(width: 60, height: 50)
        rectangle.name = "rectangle"
        rectangle.position = CGPoint(x: frame.width/6, y: 50)
        
        rectangle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 60, height: 50))
        rectangle.physicsBody?.restitution = 0.8
        rectangle.physicsBody?.linearDamping = 1
        rectangle.physicsBody?.allowsRotation = false
        rectangle.physicsBody?.affectedByGravity = false
        rectangle.physicsBody?.isDynamic = false
        rectangle.physicsBody?.categoryBitMask = PhysicsCategories.rectangle
        rectangle.physicsBody?.contactTestBitMask = PhysicsCategories.base
        rectangle.physicsBody?.collisionBitMask = PhysicsCategories.base
        rectangle.physicsBody?.usesPreciseCollisionDetection = true
        
        self.addChild(rectangle)
        
        
        circle.position = CGPoint(x: frame.width/3, y: 50)
        circle.size = CGSize(width: 50, height: 50)
        circle.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        circle.physicsBody?.restitution = 0.5
        circle.physicsBody?.linearDamping = 1
        circle.physicsBody?.allowsRotation = false
        circle.physicsBody?.affectedByGravity = false
        circle.physicsBody?.isDynamic = true
        circle.name = "circle"
        
        circle.physicsBody?.categoryBitMask = PhysicsCategories.circle
        circle.physicsBody?.contactTestBitMask = PhysicsCategories.base
        circle.physicsBody?.collisionBitMask = PhysicsCategories.base
        
        rectangle.physicsBody?.usesPreciseCollisionDetection = true
        
        self.addChild(circle)
        
        triangle.position = CGPoint(x: frame.width/2, y: 50)
        triangle.size = CGSize(width: 50, height: 50)
        triangle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        triangle.name = "triangle"
        
        triangle.physicsBody?.linearDamping = 1
        triangle.physicsBody?.allowsRotation = true
        triangle.physicsBody?.restitution = 0.8
        triangle.physicsBody?.isDynamic = false
        triangle.physicsBody?.usesPreciseCollisionDetection = true
        triangle.physicsBody?.categoryBitMask = PhysicsCategories.triangle
        triangle.physicsBody?.contactTestBitMask = PhysicsCategories.base
        triangle.physicsBody?.collisionBitMask = PhysicsCategories.base
        
        self.addChild(triangle)
        
        polygon.position = CGPoint(x: frame.width/1.5, y: 50)
        polygon.size = CGSize(width: 50, height: 50)
        polygon.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        polygon.name = "polygon"
        
        polygon.physicsBody?.linearDamping = 1
        polygon.physicsBody?.allowsRotation = true
        polygon.physicsBody?.restitution = 0.8
        polygon.physicsBody?.isDynamic = false
        polygon.physicsBody?.usesPreciseCollisionDetection = true
        polygon.physicsBody?.categoryBitMask = PhysicsCategories.polygon
        polygon.physicsBody?.contactTestBitMask = PhysicsCategories.base
        polygon.physicsBody?.collisionBitMask = PhysicsCategories.base
        
        self.addChild(polygon)
        
        
        /////////BOTONES/////////
        
        restartBtn.size = CGSize(width: 50, height: 50)
        restartBtn.position = CGPoint(x: frame.width/1.15, y: 50)
        restartBtn.color = .blue
        restartBtn.name = "restartBtn"
        
        restartBtn.physicsBody?.isDynamic = false
        
        self.addChild(restartBtn)
        
        //////BASES///////
        
   
        base.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width, height:15))
        base.size = CGSize(width: frame.width, height: 15)
        base.position = CGPoint(x: frame.width/2, y: 100)
        base.color = #colorLiteral(red: 0.9140694737, green: 0.5662171245, blue: 0.1949063838, alpha: 1)
        
        
        base.physicsBody?.categoryBitMask = PhysicsCategories.base
        base.physicsBody?.contactTestBitMask = PhysicsCategories.rectangle
        base.physicsBody?.collisionBitMask = PhysicsCategories.rectangle
        base.physicsBody?.usesPreciseCollisionDetection = true
        
        base.physicsBody?.isDynamic = false
        base.physicsBody?.affectedByGravity = false
        
        self.addChild(base)
        

        baseUp.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width, height:15))
        baseUp.size = CGSize(width: frame.width, height: 15)
        baseUp.position = CGPoint(x: frame.width/2, y: frame.height)
        baseUp.color = #colorLiteral(red: 0.9140694737, green: 0.5662171245, blue: 0.1949063838, alpha: 1)
        
        
        baseUp.physicsBody?.categoryBitMask = PhysicsCategories.base
        baseUp.physicsBody?.contactTestBitMask = PhysicsCategories.rectangle
        baseUp.physicsBody?.collisionBitMask = PhysicsCategories.rectangle
        
        baseUp.physicsBody?.isDynamic = false
        baseUp.physicsBody?.affectedByGravity = false
        
        self.addChild(baseUp)
        

        baseLeft.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 15, height:frame.height))
        baseLeft.size = CGSize(width: 15, height: frame.height)
        baseLeft.position = CGPoint(x: 0, y: frame.height / 2 + 100)
        baseLeft.color = #colorLiteral(red: 0.9140694737, green: 0.5662171245, blue: 0.1949063838, alpha: 1)
        
        
        baseLeft.physicsBody?.categoryBitMask = PhysicsCategories.base
        baseLeft.physicsBody?.contactTestBitMask = PhysicsCategories.rectangle
        baseLeft.physicsBody?.collisionBitMask = PhysicsCategories.rectangle
        
        baseLeft.physicsBody?.isDynamic = false
        baseLeft.physicsBody?.affectedByGravity = false
        
        self.addChild(baseLeft)

        baseRight.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 15, height: frame.height ))
        baseRight.size = CGSize(width: 15, height: frame.height)
        baseRight.position = CGPoint(x: frame.width, y: frame.height / 2 + 100)
        baseRight.color = #colorLiteral(red: 0.9140694737, green: 0.5662171245, blue: 0.1949063838, alpha: 1)
        
        
        baseRight.physicsBody?.categoryBitMask = PhysicsCategories.base
        baseRight.physicsBody?.contactTestBitMask = PhysicsCategories.rectangle
        baseRight.physicsBody?.collisionBitMask = PhysicsCategories.rectangle
        
        baseRight.physicsBody?.isDynamic = false
        baseRight.physicsBody?.affectedByGravity = false
        
        self.addChild(baseRight)
        
        
        
    }
    
    
    
    
    
    //    var dx = (-Int(arc4random_uniform(10)))
    //    var dy = (-Int(arc4random_uniform(5)))
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch")
        
//        physicsWorld.gravity = CGVector(dx: dx, dy: dy)
        
        guard let touch = touches.first else {
            return
        }
        
        let touchLocation = touch.location(in: self)
        let touchedNode = self.atPoint(touchLocation)
        
        
        
        
        
        
        
        let rectangleCopy = self.rectangle.copy() as! SKSpriteNode
        
        if (touchedNode.name == "rectangle" ){
            
            rectangleCopy.physicsBody?.affectedByGravity = true
            rectangleCopy.physicsBody?.isDynamic = true
            rectangleCopy.physicsBody?.allowsRotation = true
            rectangleCopy.physicsBody?.restitution = rectangleRestitution
            rectangleCounter += 1
            rectangleCopy.name = "copiedRectangle"
            
            
            if (positions.count == 0){
                showAlertNow()
                theGameIsFull = true
                
            }else{
                rectangleCopy.position = CGPoint(x: AssignPosition(), y: frame.height / 2)
                addChild(rectangleCopy)
            }
            
        }
        
        if (touchedNode.name == "copiedRectangle"){
            touchedNode.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 100))
            print("apply impulse")
        }
        
        let copiedNode = circle.copy() as! SKSpriteNode
        
        if (touchedNode.name == "circle" ){
            print(copiedNode)
            
            copiedNode.physicsBody?.affectedByGravity = true
            copiedNode.physicsBody?.isDynamic = true
            copiedNode.physicsBody?.allowsRotation = true
            copiedNode.physicsBody?.restitution = circleRestitution
            circleCounter += 1
            copiedNode.name = "copiedCircle"
            
            if (positions.count == 0){
                showAlertNow()
                theGameIsFull = true
                
            }else{
                copiedNode.position = CGPoint(x: AssignPosition(), y: frame.height / 2)
                addChild(copiedNode)
            }
            
        }
        
        if (touchedNode.name == "copiedCircle"){
            touchedNode.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 100))
            print("apply impulse")
        }
        
        let copiedTriangle = triangle.copy() as! SKSpriteNode
        
        if (touchedNode.name == "triangle"){
            
            copiedTriangle.physicsBody?.affectedByGravity = true
            copiedTriangle.physicsBody?.isDynamic = true
            copiedTriangle.physicsBody?.allowsRotation = true
            copiedTriangle.physicsBody?.restitution = triangleRestitution
            copiedTriangle.name = "copiedTriangle"
            triangleCounter += 1
            if (positions.count == 0){
                showAlertNow()
                theGameIsFull = true
                
            }else{
                copiedTriangle.position = CGPoint(x: AssignPosition(), y: frame.height / 2)
                addChild(copiedTriangle)
            }
            
        }
        
        if (touchedNode.name == "copiedTriangle"){
            touchedNode.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 100))
            print("apply impulse")
        }
        
        let copiedPolygon = polygon.copy() as! SKSpriteNode
        
        if (touchedNode.name == "polygon"){
           
            copiedPolygon.physicsBody?.affectedByGravity = true
            copiedPolygon.physicsBody?.isDynamic = true
            copiedPolygon.physicsBody?.allowsRotation = true
            copiedPolygon.physicsBody?.restitution = pentagonRestitution
            copiedPolygon.name = "copiedPolygon"
            polygonCounter += 1
            
            if (positions.count == 0){
                showAlertNow()
                theGameIsFull = true
                
            }else{
                copiedPolygon.position = CGPoint(x: AssignPosition(), y: frame.height / 2)
                addChild(copiedPolygon)
            }
           
        }
        if (touchedNode.name == "copiedPolygon"){
            touchedNode.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 100))
            print("apply impulse")
        }

       
        
        if (touchedNode.name == "restartBtn"){
            restartGame()
            
        }
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -10)
        let rectangleSound = SKAction.playSoundFileNamed("Sprout.m4a", waitForCompletion: false)
        let circleSound = SKAction.playSoundFileNamed("Muffin.m4a", waitForCompletion: false)
        let triangleSound = SKAction.playSoundFileNamed("Slacker.m4a", waitForCompletion: false)
        let polygonSound = SKAction.playSoundFileNamed("Kiss.m4a", waitForCompletion: false)
        
        //
        //        let contactX = contact.contactPoint.x
        //        let contactY = contact.contactPoint.y
        
        //        func getContact(x posx: CFloat, y posy: CGFloat) -> (CGFloat, CGFloat){
        //            let contactX = contact.contactPoint.x
        //            let contactY = contact.contactPoint.y
        //
        //            return (contactX, contactY)
        //
        //        }
        
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if ((firstBody.categoryBitMask & PhysicsCategories.rectangle != 0) && (secondBody.categoryBitMask & PhysicsCategories.base != 0)) {
            
            run(rectangleSound)
            
        }
        
        
        if ((firstBody.categoryBitMask & PhysicsCategories.triangle != 0) && (secondBody.categoryBitMask & PhysicsCategories.base != 0)) {
            
            run(triangleSound)
            
        }
        
        
        if((firstBody.categoryBitMask & PhysicsCategories.circle != 0) && (secondBody.categoryBitMask & PhysicsCategories.base != 0)){
            

            run(circleSound)

            
        }
        
        if((firstBody.categoryBitMask & PhysicsCategories.polygon != 0) && (secondBody.categoryBitMask & PhysicsCategories.base != 0)){

            run(polygonSound)

            
        }
        
        
        //
        //
        //
        //        func createParticles(){
        //            let shine = CAEmitterLayer()
        //            shine.emitterSize = CGSize(width: 100, height: 100)
        //            shine.emitterPosition = CGPoint(x: 100, y: 100)
        //            let flake = makeEmitterCell()
        //            shine.emitterCells = [flake]
        //            print("emitter")
        //        }
        //
        //        func makeEmitterCell() -> CAEmitterCell{
        //            let cell = CAEmitterCell()
        //            cell.birthRate = 100
        //            cell.scale = 20
        //            cell.contentsScale = 20
        //            cell.lifetime = 20
        //            cell.color = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        //            cell.contents = SKShapeNode(circleOfRadius: 20)
        //            return cell
        //
        //        }
        //        makeEmitterCell()
        //        createParticles()
        
        //        func newSmokeEmitter() -> SKEmitterNode? {
        //            return SKEmitterNode(fileNamed: "smoke.sks")
        //        }
        
        
        
        
    }
    
    override func update(_ currentTime: TimeInterval){
        physicsWorld.gravity = CGVector(dx: dx, dy: dy)
    }
    
}

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0 , width: 940, height: 560))
sceneView.backgroundColor = #colorLiteral(red: 0.945002377, green: 0.8912561536, blue: 0.7239055037, alpha: 1)
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    
    scene.scaleMode = .aspectFit
//    scene.size = CGSize(width: 750, height: 600)
    
    // Present the scene
    sceneView.presentScene(scene)
}




PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

 //#-end-hidden-code





