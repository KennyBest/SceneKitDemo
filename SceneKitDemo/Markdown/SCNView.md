#  SCNView

## 预览
在macOS系统中，`SCNView`是`NSView`的子类。在iOS和tvOS中，`NSView`是`UIView`的子类。作为操作系统中视图层级的一部分，一个`SCNView`对象在用户交互中为`SceneKit`内容提供了空间。你可以通过`init(frame:options)`方法来创建`SCNView`或在IB文件中直接添加。为了给`SCNView`提供内容，给它的`scene`属性赋一个`Scene`对象。
可以在`SCNSceneRenderer`协议中去查看额外重要的方法和属性。你可以在一个独立元数据命令队列中渲染`SceneKit`内容或者使用`SCNRenderer`类来渲染`OpenGL`内容以及在macOS上使用`SCNLayer`处理Core Animation layer。

## 提要
### 初始化SceneKit view
```
init(frame: CGRect, options: [String : Any]? = nil)
```
```
struct SCNView.Option

//
static let preferLowPowerDevice: SCNView.Option

//
static let preferredDevice: SCNView.Option

//
static let preferredRenderingAPI: SCNView.Option
```
### 明确scene
视图显示的情景
```
var scene: SCNScene?
```
### 配置视图
1. 视图的背景色
```
var backgroundColor: NSColor
```
2. 决定用户是否可以操纵用来渲染情景的视图的当前指向
```
var allowsCameraControl: Bool
```
3. 抗锯齿模式
```
var antialiasingMode: SCNAntialiasingMode
```
4. 设置帧率
```
var preferredFramesPerSecond: Int
```
### 执行动作和动画
1. 暂停播放
```
func pause(Any?)
```
2. 播放
```
func play(Any?)
```
3. 停止播放，并重置scene的启动时间
```
func stop(Any?)
```
### 截屏
```
func snapshot() -> UIImage
```
### 处理OpenGL ES Context
```
var eaglContext: EAGLContext?
```
### 处理OpenGL Context

```
var openGLContext: NSOpenGLContext?

var pixelFormat: NSOpenGLPixelFormat?
```
### Constants
1. 抗锯齿模式
*  `none` 无抗锯齿模式
* `multisampling2X`
* `multisampling4X`
* `multisampling8X`
* `multisampling16X`

### 实例属性
```
var cameraControlConfiguration: SCNCameraControlConfiguration

var defaultCameraController: SCNCameraController?

var rendersContinously: Bool
```

