# UI 设计规范

## 设计原则

1. **大屏优先** - 为 13 英寸平板优化，充分利用屏幕空间
2. **横屏为主** - 默认横屏使用，支持竖屏
3. **简洁高效** - 减少层级，信息一目了然
4. **Material Design 3** - 遵循 Google 设计规范，融入 vivo 风格

## 色彩系统

### 主色调
```
Primary: #6750A4        // 紫色 - 品牌色
Primary Container: #EADDFF
Secondary: #625B71
Secondary Container: #E8DEF8
Tertiary: #7D5260
Tertiary Container: #FFD8E4
```

### 中性色
```
Surface: #FFFBFE        // 背景
Surface Variant: #E7E0EC
On Surface: #1C1B1F     // 主要文字
On Surface Variant: #49454F
Outline: #79747E
```

### 功能色
```
Error: #B3261E
Success: #4CAF50
Warning: #FF9800
Info: #2196F3
```

## 字体规范

| 样式 | 大小 | 字重 | 用途 |
|------|------|------|------|
| Display Large | 57sp | Regular | 欢迎页标题 |
| Headline Large | 32sp | Medium | 页面标题 |
| Title Large | 22sp | Medium | 卡片标题 |
| Body Large | 16sp | Regular | 正文 |
| Body Medium | 14sp | Regular | 次要文字 |
| Label Large | 14sp | Medium | 按钮文字 |

## 布局规范

### 横屏模式（双栏）
```
+------------------+------------------------+
|                  |                        |
|   会话列表       |      聊天窗口          |
|   宽度: 360dp    |      宽度: 自适应       |
|                  |                        |
|  - 头像           |  - 消息气泡             |
|  - 名称           |  - 输入框               |
|  - 最后消息       |  - 工具栏               |
|  - 时间           |                        |
|                  |                        |
+------------------+------------------------+
```

### 竖屏模式（单栏）
```
+------------------+
| 标题栏            |
+------------------+
|                  |
|   会话列表        |
|                  |
|  - 头像           |
|  - 名称           |
|  - 最后消息       |
+------------------+
```

### 间距规范
- 页面边距：16dp
- 卡片间距：8dp
- 元素间距：12dp
- 列表项高度：72dp

## 组件规范

### 消息气泡
- 自己：右下角，Primary Container 背景
- 对方：左上角，Surface Variant 背景
- 圆角：16dp（上角根据方向调整）
- 最大宽度：70% 屏幕宽度
- 内边距：12dp

### 输入框
- 高度：56dp
- 圆角：28dp（胶囊形状）
- 背景：Surface Variant
- 左侧：表情按钮
- 右侧：发送按钮

### 头像
- 尺寸：48dp（列表）/ 40dp（消息中）
- 圆角：50%（圆形）
- 占位：首字母 + Primary Container 背景

## 动画规范

| 动画 | 时长 | 缓动 |
|------|------|------|
| 页面切换 | 300ms | easeInOut |
| 消息发送 | 150ms | easeOut |
| 列表加载 | 200ms | easeIn |
| 按钮按压 | 100ms | easeOut |

## 图标规范

- 使用 Material Symbols
- 线条风格，圆角端点
- 尺寸：24dp（标准）/ 20dp（紧凑）
- 颜色：On Surface Variant

## 暗色主题

```
Surface: #1C1B1F
Surface Variant: #49454F
On Surface: #E6E1E5
Primary: #D0BCFF
Primary Container: #4F378B
```
