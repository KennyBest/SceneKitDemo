#  SCNScene

一个情景图 :  一个显示的3D情景中依附于几何体、光度、角度等其它属性的节点的层级结构。

## 预览
一个情景对象呈现了一个三维情景和它的内容。想渲染情景的话，使用`SCNView`、`SCNLayer`(仅支持macOS)、`SCNRenderer`这几个类和`SCNSceneRenderer`协议。`SCNScene`类还提供了读写情景文件的接口。

## 获取或创建一个情景
通常，你从一个用其它3D制作工具创建的文件获取情景。如果你在应用的绑定的资源目录中导入情景文件，为了SceneKit最佳加载性能Xcode会压缩它们。使用`init(named:)`,`init(named: inDirectory: options:)`，`init(url:options:)`方法或者`SCNSceneSource`类中的接口。
> 为了最佳结果，在app将情景文件放到以`.scnasets`拓展名结尾的文件夹中。将这些情景引用到作为纹理的图片放在`Asset Catalog`中。Xcode会在任何一台目标设备上优化这些文件和纹理资源，以`App Thinning and On-Demand Resources`准备分发这些纹理资源。

另外，你可以创建一个空的情景，并通过创建一些节点层，把节点以子节点的方式添加到`rootNode`上作为内容构建它。

## 保存一个情景
使用`write(to:options:delegate:progressHandler:)`方法将一个scene保存到文件中。需要明确的文件格式根据系统版本不同。

* 自iOS10.0，tvOS10.0,watchOS 3.0, OSX v10.11以及其之后版本，明确`.scn`后缀名来以`SceneKit`本地格式保存文件。这种格式支持所有的`SceneKit`特征。并且这种格式读取速度比其它格式要快。
*  仅在macOS中，明确标记`.dae`后缀名来导出数字资源交换格式(DAE)。导出的dae文件不包含对`SceneKit`来说特殊的情景元素。
* 旧的版本中没有`write`方法，但依然可以产生`.scn`格式的文件。`SceneKit`支持`NSSecureCoding`协议，使用`NSKeyedArchiver`类来序列化一个情景和它全部的内容，然后使用`NSKeyedUnarchiver`类加载一个归档的情景。

## 在情景中使用动画

一个情景对象决定了包含在情境图中所有动画的基础时间。利用在下列中`Managing Scene Attributes`模块中方法和`Scene Attributes`模块中常量key值来控制情景时间属性。

## 主题

### 创建或加载一个情景
1. `init?(named: String)`
    在app main bundle中加载一个明确名称的情景文件。
2. `init?(named: String, inDirectory: String?, options: [SCNSceneSource.LoadingOption : Any]? = nil)
`
    在app main bundle中一个明确的子目录下加载一个特定名称的情景文件
3. `init(url: URL, options: [SCNSceneSource.LoadingOption : Any]? = nil)`
4. `init(mdlAsset: MDLAsset)`

### 在场景中管理动画效果
决定在情景图中是否执行动作、动画、粒子系统和物理模拟。

```Swift
var isPaused: Bool
```
### 获取情景中内容

1. 情景中的根节点
```
var rootNode: SCNNode
```
2. 在情景静止之前被渲染的背景
```
var background: SCNMaterialProperty
```
3. 一个立方形纹理来描述情景内容周边环绕的环境，用来被设置有效的光度效果
```
var lightingEnvironment: SCNMaterialProperty
```
### 管理情景属性
1. 获取属性
```
func attribute(forKye: String)
```
2. 设置属性
```
func setAttribute(Any?, forKey: String)
```
3. 可设置的属性列表
```
struct SCNScene.Attribute
```
常量字符串：
```
// 设置一个浮点类型的NSNumber对象 设置endTime
static let endTime: SCNScene.Attribute

// 设置一个浮点类型的NSNumber对象 设置帧数
static let frameRate: SCNScene.Attribute

// 设置一个浮点类型的NSNumber对象 设置startTime
static let startTime: SCNScene.Attribute

// SCNVector3类型的NSValue对象，设置情景的方向
static let upAxis: SCNScene.Attribute
```
### 导出情景文件
1. write方法
```
func write(to: URL, options: [String : Any]? = nil, delegate: SCNSceneExportDelegate?, progressHandler: SCNSceneExportProgressHandler? = nil)
```
2. `protocol SCNSceneExportDelegate`

### 添加阴影

```
// 距情景内容开始被遮盖的点的距离 可显式动画
var fogStartDistance: CGFloat

// 距情景内容完全被遮盖的点的距离 可显式动画
var fogEndDistance: CGFloat

// 从开始点到结束点的遮盖强度转变曲线 可显式动画
var fogDensityExponent: CGFloat

// 遮盖效果颜色 可显式动画
var fogColor: Any
```
### 添加物理模拟
```
// 情景关联的物理模拟效果
var physicsWorld: SCNPhysicsWorld
```
### 粒子效果
1. 添加粒子系统
```
func addParticleSystem(SCNParticleSystem, transform: SCNMatrix4)
```
2. 获取粒子系统
```
var particleSystems: [SCNParticleSystem]?
```
3. 移除粒子系统
```
func removeParticleSystem(SCNParticleSystem)
```
4. 移除全部粒子系统
```
func removeAllParticleSystems()
```
### 一些常量

1. `SCNSceneExportProgressHandler`
```
/*
param1: totalProgress(0.0 ~ 1.0) 0.0是开始，1.0结束
param2: error
param3: stop 在block里面设置*stop为true来取消导出。
*/
typealias SCNSceneExportProgressHandler = (Float, Error?, UnsafeMutablePointer<ObjCBool>) -> Void
```







