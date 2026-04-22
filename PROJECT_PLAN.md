# vivo Pad5 Pro 聊天 App - 项目方案

## 📱 设备信息

| 项目 | 规格 |
|------|------|
| 设备 | vivo Pad5 Pro |
| 屏幕 | 13 英寸 LCD, 3096×2064, 144Hz |
| 处理器 | 联发科天玑 9400 |
| 内存 | 12GB/16GB LPDDR5X |
| 系统 | OriginOS 5 HD (Android 15) |
| 特性 | 手写笔支持, 键盘适配, 分屏多任务 |

## 🎯 项目目标

开发一款专为 vivo Pad5 Pro 大屏优化的聊天应用，支持：
- 即时消息（文字、图片、语音）
- AI 助手集成
- 多设备同步
- 横屏/分屏适配

## 🛠 技术栈

### 前端
- **Flutter 3.24+** - 跨平台开发框架
- **Dart 3.5+** - 编程语言

### 后端
- **Firebase** - 认证、实时数据库、推送
- **Cloud Functions** - 服务端逻辑
- **OpenAI API / Claude API** - AI 助手

### 为什么选 Flutter？
1. 你已有 Flutter 项目经验（Agent Party Pad）
2. 一套代码同时支持 Android 手机和平板
3. 天玑 9400 性能强劲，Flutter 流畅运行
4. 丰富的第三方库生态

## 📁 项目结构

```
0112/
├── docs/                    # 文档
│   ├── PRD.md              # 产品需求文档
│   ├── UI_SPEC.md          # UI 设计规范
│   └── API_SPEC.md         # 接口规范
├── src/                     # 源码
│   ├── android/            # Android 原生配置
│   ├── ios/                # iOS 原生配置（预留）
│   ├── lib/                # Dart 源码
│   │   ├── main.dart
│   │   ├── app.dart
│   │   ├── models/         # 数据模型
│   │   ├── screens/        # 页面
│   │   ├── widgets/        # 组件
│   │   ├── services/       # 服务层
│   │   ├── providers/      # 状态管理
│   │   └── utils/          # 工具函数
│   ├── assets/             # 静态资源
│   │   ├── images/
│   │   ├── fonts/
│   │   └── animations/
│   └── test/               # 测试
├── .github/                 # GitHub 配置
│   └── workflows/          # CI/CD 工作流
│       ├── build.yml       # 编译 APK
│       └── release.yml     # 发布版本
├── firebase/                # Firebase 配置
├── tools/                   # 脚本工具
├── pubspec.yaml            # Flutter 依赖
├── analysis_options.yaml   # 代码规范
├── README.md
└── LICENSE
```

## 🎨 UI 设计要点

### 大屏适配
- 横屏模式：左侧会话列表 + 右侧聊天窗口（类似微信 PC 版）
- 竖屏模式：全屏会话列表，点击进入聊天
- 分屏支持：最小宽度 600dp 时保持双栏

### 视觉风格
- Material Design 3 + vivo OriginOS 风格融合
- 圆角卡片、柔和阴影
- 暗色/亮色主题切换
- 动态配色（基于壁纸）

## 🔧 核心功能模块

### 1. 认证模块
- 手机号 + 验证码登录
- Google/微信 OAuth（可选）
- 游客模式

### 2. 消息模块
- 文字消息（支持 Markdown）
- 图片消息（多选、压缩、预览）
- 语音消息（录制、播放、波形）
- 文件消息（PDF、文档）
- 消息状态（发送中、已送达、已读）

### 3. 会话模块
- 单聊、群聊
- 会话置顶、免打扰
- 消息搜索
- 聊天记录导出

### 4. AI 助手模块
- 内置 AI 聊天机器人
- 支持上下文对话
- 代码高亮、数学公式渲染
- 快捷指令（/翻译 /总结 /写代码）

### 5. 设置模块
- 账号管理
- 通知设置
- 主题切换
- 存储管理
- 关于/帮助

## 📡 API 接口规划

### Firebase 实时数据库结构
```json
{
  "users": {
    "uid": {
      "name": "用户名",
      "avatar": "头像URL",
      "status": "online|offline",
      "lastSeen": 1234567890
    }
  },
  "chats": {
    "chatId": {
      "type": "direct|group",
      "participants": {"uid": true},
      "lastMessage": {},
      "updatedAt": 1234567890
    }
  },
  "messages": {
    "chatId": {
      "msgId": {
        "sender": "uid",
        "type": "text|image|voice|file",
        "content": "消息内容",
        "timestamp": 1234567890,
        "status": "sent|delivered|read"
      }
    }
  }
}
```

### AI 助手接口
- 请求：POST /api/chat/completions
- 支持模型：GPT-4o / Claude 3.5 / Kimi
- 流式响应：SSE

## 🔐 安全规范

1. **数据加密**
   - 本地 SQLite 加密（SQLCipher）
   - 网络传输 TLS 1.3
   - 敏感字段 AES-256 加密

2. **隐私保护**
   - 最小权限原则
   - 数据本地优先，云端同步可选
   - 消息阅后即焚（可选）

## 📅 开发计划

| 阶段 | 时间 | 内容 |
|------|------|------|
| Phase 1 | Week 1 | 项目搭建、UI 框架、登录页 |
| Phase 2 | Week 2 | 消息列表、聊天页、基础消息发送 |
| Phase 3 | Week 3 | 图片/语音消息、AI 助手集成 |
| Phase 4 | Week 4 | 群聊、设置、主题切换 |
| Phase 5 | Week 5 | 大屏适配、分屏优化、性能调优 |
| Phase 6 | Week 6 | 测试、打包、发布 |

## 🚀 GitHub Actions 工作流

### build.yml
- 触发：push 到 main 分支 / PR
- 环境：ubuntu-latest
- 步骤：
  1. 检出代码
  2. 安装 Flutter
  3. 获取依赖
  4. 运行测试
  5. 编译 APK（release）
  6. 上传产物

### release.yml
- 触发：tag 推送（v*）
- 额外步骤：
  1. 生成签名密钥
  2. 签名 APK
  3. 创建 GitHub Release
  4. 上传签名 APK

## 📦 依赖清单

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # 状态管理
  flutter_riverpod: ^2.5.0
  
  # 网络
  dio: ^5.4.0
  web_socket_channel: ^2.4.0
  
  # Firebase
  firebase_core: ^2.24.0
  firebase_auth: ^4.16.0
  cloud_firestore: ^4.14.0
  firebase_messaging: ^14.7.0
  
  # 本地存储
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  
  # UI 组件
  flutter_screenutil: ^5.9.0
  flutter_svg: ^2.0.9
  cached_network_image: ^3.3.0
  shimmer: ^3.0.0
  
  # 多媒体
  image_picker: ^1.0.7
  audio_waveforms: ^1.0.0
  photo_view: ^0.14.0
  
  # 工具
  intl: ^0.19.0
  uuid: ^4.3.0
  logger: ^2.0.2
  
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  build_runner: ^2.4.0
  hive_generator: ^2.0.0
```

## 📝 命名规范

- 仓库名：`vivo-pad-chat`
- 包名：`com.alisalily.vivopadchat`
- 应用名：「畅聊」或「PadChat」

---

**下一步**：确认方案后，开始创建 Flutter 项目骨架和 GitHub 仓库。
