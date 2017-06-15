#  SCNNode

## SceneKit 坐标系
屏幕横轴右方向为正，屏幕竖轴上方向为正，屏幕正对着前方（这个轴向为z轴），靠近屏幕为正。

## SCNNode
是情景图中的结构元素，描述了在3D坐标系中的位置和形变。可以吸附几何体、光度、视角等其它可视化内容。

一个节点自身是没有可视化内容的，只描述了它相对于父节点的空间transform。通过创建节点来创建结构树，给节点添加光度、视角、几何体来创建可视化内容。

### Nodes Determine the Structure of a Scene 节点决定情景的结构

节点的层级在情景中定义了内容组织以及使用`SceneKit`呈现和操作这些内容的能力。使用`SceneKit`可以程序化地创建节点，或者加载一个3D工具制作的软件，甚至两者方式混合着用。`SceneKit`提供了很多功能来组织和搜索情景图。

### Topics

#### Creating a Node
创建并返回一个明确吸附几何体的节点。
```
init(geometry: SCNGeometry?)
```
创建一个明确模型I/O对象的节点
```
init(mdlObject: MDLObject)
```
#### Managing the Node's Transformation
相对于其父节点的转变。可显式动画
```
var transform: SCNMatrix4
```
```
// 节点转移位置 Animatable
var position: SCNVector3

// 节点的方向 通过沿着一个轴旋转 Animatable
var rotation: SCNVector4

// 节点的方向表达了高度、偏移量、翻转角度
var eulerAngle: SCNVector3

//
var orientation: SCNQuaternion

//
var scale: SCNVector3

// 中心点
var pivot: SCNMatrix4

//
var worldTransform: SCNMatrix4 { get }
```
> rotation、eulerAngle、orientation都会影响节点transform属性，影响了翻转切面。改变其中一个都会对另外两个属性产生影响。

```
protocol SCNBoundingVolume
```
#### Managing Node Attributes

给节点关联名称
```
var name: String?
```

```
var light: SCNLight?
var camera: SCNCamera?
var geometry: SCNGeometry?
// 添加一个变形器
var morpher: SCNMorpher?
// 添加皮肤 响应骨骼动画
var skinner: SCNSkinner?
// 这个节点属于那一类
var categoryBitMask: Int
```
#### Constraining Node Behavior 约束节点行为
```
var constraints: [SCNConstrint]?
```
#### Working With Node Animation

```

var presentation: SCNNode

var isPaused: Bool
```

#### Modifying the Node Visibility

```
// 决定节点内容是否显示。 Animatable
var isHidden: Bool
// opacity 不透明度
var opacity: CGFloat

//
var renderingOrder: Int

var castsShadow: Bool

var movabilityHint: SCNMovabilityHint
```
#### Managing the Node Hierarchy

```
var parent: SCNNode?
var childNodes: [SCNNode]
var addChildNode(SCNNode)
var insertChildNode(SCNNode, at: Int)
var removeFromParentNode()
var replaceChildNode(SCNNode, with: SCNNode)
```
#### 搜索
```

```

