# API 接口规范

## 基础信息

- 基础 URL: `https://api.padchat.example.com/v1`
- 认证方式: Bearer Token (JWT)
- 数据格式: JSON
- 编码: UTF-8

## 认证接口

### 注册
```http
POST /auth/register
Content-Type: application/json

{
  "phone": "+86138xxxxxxxx",
  "code": "123456",
  "name": "用户名",
  "avatar": "https://..."
}

Response:
{
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "user": {
    "id": "uuid",
    "name": "用户名",
    "avatar": "https://..."
  }
}
```

### 登录
```http
POST /auth/login
Content-Type: application/json

{
  "phone": "+86138xxxxxxxx",
  "code": "123456"
}

Response:
{
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "user": { ... }
}
```

## 用户接口

### 获取当前用户
```http
GET /users/me
Authorization: Bearer <token>
```

### 更新用户信息
```http
PUT /users/me
Authorization: Bearer <token>
Content-Type: application/json

{
  "name": "新名字",
  "avatar": "https://...",
  "status": "在线"
}
```

### 搜索用户
```http
GET /users/search?q=关键词
Authorization: Bearer <token>
```

## 会话接口

### 获取会话列表
```http
GET /chats
Authorization: Bearer <token>

Response:
{
  "chats": [
    {
      "id": "chat_uuid",
      "type": "direct",
      "name": "对方名字",
      "avatar": "https://...",
      "lastMessage": {
        "content": "最后一条消息",
        "timestamp": 1699123456,
        "unread": 3
      },
      "updatedAt": 1699123456
    }
  ]
}
```

### 创建会话
```http
POST /chats
Authorization: Bearer <token>
Content-Type: application/json

{
  "type": "direct",
  "participantId": "user_uuid"
}
```

### 创建群聊
```http
POST /chats
Authorization: Bearer <token>
Content-Type: application/json

{
  "type": "group",
  "name": "群名称",
  "participantIds": ["user1", "user2", "user3"]
}
```

## 消息接口

### 获取消息历史
```http
GET /chats/{chatId}/messages?limit=50&before=messageId
Authorization: Bearer <token>

Response:
{
  "messages": [
    {
      "id": "msg_uuid",
      "senderId": "user_uuid",
      "type": "text",
      "content": "消息内容",
      "timestamp": 1699123456,
      "status": "read",
      "replyTo": null
    }
  ],
  "hasMore": true
}
```

### 发送消息
```http
POST /chats/{chatId}/messages
Authorization: Bearer <token>
Content-Type: application/json

{
  "type": "text",
  "content": "消息内容",
  "replyTo": "msg_uuid"  // 可选，回复某条消息
}

Response:
{
  "id": "msg_uuid",
  "status": "sent",
  "timestamp": 1699123456
}
```

### 发送图片
```http
POST /chats/{chatId}/messages
Authorization: Bearer <token>
Content-Type: multipart/form-data

image: [二进制文件]
caption: "图片描述（可选）"
```

### 标记已读
```http
POST /chats/{chatId}/read
Authorization: Bearer <token>
Content-Type: application/json

{
  "lastMessageId": "msg_uuid"
}
```

## AI 助手接口

### 发送消息给 AI
```http
POST /ai/chat
Authorization: Bearer <token>
Content-Type: application/json

{
  "model": "gpt-4o",
  "messages": [
    {"role": "user", "content": "你好"}
  ],
  "stream": true  // 是否流式返回
}

Response (SSE):
data: {"delta": "你", "finish": false}
data: {"delta": "好", "finish": false}
data: {"delta": "！", "finish": true}
```

### 获取可用模型
```http
GET /ai/models
Authorization: Bearer <token>

Response:
{
  "models": [
    {"id": "gpt-4o", "name": "GPT-4o", "description": "最智能的模型"},
    {"id": "claude-3-5", "name": "Claude 3.5", "description": "擅长代码"},
    {"id": "kimi", "name": "Kimi", "description": "长文本处理"}
  ]
}
```

## WebSocket 实时消息

### 连接
```javascript
ws://api.padchat.example.com/ws?token=<jwt_token>
```

### 消息格式
```json
{
  "type": "message|typing|read|system",
  "payload": { ... }
}
```

### 发送消息
```json
{
  "type": "message",
  "payload": {
    "chatId": "chat_uuid",
    "content": "消息内容",
    "type": "text"
  }
}
```

### 接收消息
```json
{
  "type": "message",
  "payload": {
    "id": "msg_uuid",
    "chatId": "chat_uuid",
    "senderId": "user_uuid",
    "content": "消息内容",
    "timestamp": 1699123456
  }
}
```

### 正在输入
```json
{
  "type": "typing",
  "payload": {
    "chatId": "chat_uuid",
    "userId": "user_uuid",
    "isTyping": true
  }
}
```

## 错误码

| 状态码 | 含义 | 说明 |
|--------|------|------|
| 200 | 成功 | 请求正常完成 |
| 400 | 参数错误 | 请求参数不合法 |
| 401 | 未授权 | Token 无效或过期 |
| 403 | 禁止访问 | 无权访问该资源 |
| 404 | 不存在 | 资源未找到 |
| 429 | 请求过多 | 触发限流 |
| 500 | 服务器错误 | 内部错误 |

## 限流规则

| 接口 | 限制 |
|------|------|
| 发送消息 | 100条/分钟 |
| AI 对话 | 20次/分钟 |
| 上传文件 | 10MB/文件 |
| 图片压缩 | 最大 1920x1080 |
