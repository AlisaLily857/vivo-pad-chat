# Glassmorphism UI 设计规范

## 设计理念

现代玻璃拟态 (Glassmorphism) 风格，融合 3D 元素和柔和渐变，打造轻盈、通透、富有层次感的视觉体验。

## 色彩系统

### 主背景
- 渐变底色: `linear-gradient(135deg, #E0F7FA 0%, #F3E5F5 50%, #E8F5E9 100%)`
- 薄荷绿: `#E0F7FA` (rgb(224, 247, 250))
- 薰衣草紫: `#F3E5F5` (rgb(243, 229, 245))
- 淡春绿: `#E8F5E9` (rgb(232, 245, 233))

### 玻璃容器
- 背景: `rgba(255, 255, 255, 0.25)`
- 边框: `1px solid rgba(255, 255, 255, 0.4)`
- 阴影: `0 8px 32px rgba(31, 38, 135, 0.1)`
- 模糊: `backdrop-filter: blur(20px)`
- 内发光: `inset 0 1px 0 rgba(255, 255, 255, 0.6)`

### 强调色
- 主色: `#7C4DFF` (紫罗兰)
- 次色: `#69F0AE` (薄荷绿)
- 点缀: `#FFD740` (琥珀黄)
- 文字主色: `#2D3436` (深灰)
- 文字次色: `#636E72` (中灰)

## 字体规范

- 标题: `font-family: 'SF Pro Display', -apple-system, sans-serif`
- 正文: `font-family: 'SF Pro Text', -apple-system, sans-serif`
- 大标题: 32px, weight 700, letter-spacing -0.5px
- 模块标题: 20px, weight 600
- 正文: 16px, weight 400, line-height 1.6

## 组件规范

### Glass Card
```
border-radius: 24px
background: rgba(255, 255, 255, 0.25)
backdrop-filter: blur(20px)
border: 1px solid rgba(255, 255, 255, 0.4)
box-shadow: 
  0 8px 32px rgba(31, 38, 135, 0.1),
  inset 0 1px 0 rgba(255, 255, 255, 0.6)
```

### 3D Icon Container
```
width: 64px
height: 64px
border-radius: 20px
background: linear-gradient(135deg, #7C4DFF, #69F0AE)
box-shadow: 
  0 10px 20px rgba(124, 77, 255, 0.3),
  0 6px 6px rgba(124, 77, 255, 0.2)
transform: translateZ(20px)
```

### Bento Grid
```
display: grid
grid-template-columns: repeat(4, 1fr)
gap: 20px
padding: 24px
```

## 动画规范

- 悬浮: `transform: translateY(-4px)`, duration 300ms, ease-out
- 加载: 脉冲发光动画, 2s infinite
- 切换: 淡入淡出 + 轻微缩放, 200ms
