#  Scene Kit 介绍
`Scene Kit`是一个3D渲染框架，整合了具有高级别API的高性能渲染引擎。支持导入、操作、渲染3D资源，无须像OpenGL方式那样添加额外的步骤。

**预览**
* 导入3D对象并且建立静态场景
* 控制尺寸、集合位置
* 以（DAE: 数字资源交换）局域交换格式加载3D内容
* 给3D内容添加交互
* 将其它技术融合到app中
* 利用Xcode预览、检查、调整DAE文件

## Scene Kit is a Supporting Technology
`Scene Kit`在结构层中位于`Cocoa`下面和`OpenGL`上面。和`Quartz`、`Core Animation`、`GL Kit`技术同等，整合了一些其它的几何技术，能够让你使用多个技术实现更广的结果。
因为`Scene Kit`整合了`Image Kit`和`Core Animation`，所以你不需要额外的3D几何编程技术。比如，你可以在一个layer中嵌入3D场景，然后利用`Core Animation`的混合能力去添加覆盖物和背景。也可以用`Core Animation`layer作为3D场景中元素的纹理。

## Scene Kit Enables 3D Assets in Your App

`Scene Kit`在app中嵌入3D渲染， 允许你执行以下任务。

### Loading Assets 加载资源
大部分3D模型不能程序化地设计。它们必须在3D模型软件中创建，然后导入到项目中。`Scene Kit`允许你以DAE格式文件导入。这种交换格式被大部分app支持。
3D文件创建后，你可以通过`Scene Kit`来获取所有信息（包括坐标信息、对象形变、动画、颜色、纹理）。

### Manipulating and Rendering 3D Scenes
`Scene Kit`框架提供一个灵活的基于场景几何系统来创建和渲染虚拟的3D场景。基于节点设计，`Scene Kit`场景图表可以抽象用户使用组件的内部构件。当需要有效地渲染的时候`Scene Kit`会利用`GPU`的性能在背后做所有的工作。

提供3种方式渲染3D场景： 视图方式（SCNView）、 图层方式(SCNLayer)、渲染器方式(NCNRenderer)。
* `SCNView`在IB里面可以直接获取到。比较简单整合到UI中。
* `SCNLayer`可以将3D场景整合到layer tree中，可以有效地利用`Core Animation`。
* `SCNRenderer`可以在离屏渲染的时候在低层级的OpenGL上下文中渲染。

### Animating 3D Scenes

可以同`Core Animation`灵活且强大能力一样给3DScene添加动画，利用现有的`Core Animation`的API去支持隐式和显式的动画。

两种整合`Scene Kit`到app的方式，一种是使用SceneKit加载几何场景信息，然后使用自己的渲染引擎去渲染，另一种是利用`SCNView`或`SCNLayer`。

## Scene Graph Layout
SCNScene ---> SCNNode ----> SCNCamera 、 SCNLight、SCNGeometry ---> SCNMaterial SCNMaterialProperty

## Mixing Scene Kit and OpneGL
使用`Scene Kit`渲染OpenGL节点的三种方式:
### Setting a Renderer Delegate to a Node
### Setting Your Own Program on a Material
### Using a Delegate to Render Your Own OpenGL Code


## Using Xcode to Simplify Your Work

