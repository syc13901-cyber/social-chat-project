# FlashMeow —— 鸿蒙社交聊天项目

## 项目简介

FlashMeow是基于鸿蒙操作系统（HarmonyOS）开发的智能社交聊天应用。项目以“轻量化设计、智能化协同、全场景覆盖”为核心理念，聚焦于即时通讯、语音消息、智能语音识别、联系人管理、朋友圈动态等功能，致力于为用户带来高效、便捷、智能的社交体验。“Flash（闪现）” 对应 “闪信” 的快速

## 主要功能

- **即时聊天**：支持文本、语音等多种消息类型的发送与接收。
- **语音消息**：内置录音、语音转文字、语音播放等功能，支持长按录音、松开发送、滑动取消等交互。
- **联系人管理**：支持联系人列表、搜索、添加、分组等操作。
- **朋友圈动态**：可浏览好友动态，支持图片、文字等多媒体内容。
- **多端适配**：基于鸿蒙ArkUI，适配多种设备形态。
- **权限与安全**：完善的权限管理与本地数据存储，保障用户隐私安全。

## 目录结构

```
social-chat-media/
├── AppScope/                # 应用全局配置与资源
├── entry/
│   ├── src/
│   │   └── main/
│   │       ├── ets/
│   │       │   ├── component/   # 通用UI组件（如Toolbar、聊天气泡等）
│   │       │   ├── model/       # 数据模型与接口
│   │       │   ├── pages/       # 页面模块（聊天、联系人、动态、二维码等）
│   │       │   ├── utils/       # 工具类（录音、语音识别、权限、Toast等）
│   │       │   └── views/       # 页面视图（登录、注册、主界面、聊天等）
│   │       └── resources/       # 资源文件（图片、字符串、颜色等）
│   └── build-profile.json5      # 构建配置
├── hvigor/                      # 构建工具配置
├── README.md                    # 项目说明文档
└── ...
```

## 技术实现

- **前端框架**：ArkUI（鸿蒙官方UI框架）
- **音频处理**：基于 `@kit.AudioKit` 实现录音、播放，录音文件带有精确时间戳
- **语音识别**：集成 `SpeechRecognizerManager` 实现语音转文字
- **本地存储**：使用 `PreferenceUtils` 管理用户信息与本地数据
- **页面导航**：支持组件导航（Navigation）与页面路由（@ohos.router）
- **权限管理**：通过 `PermissionUtils` 动态申请与校验麦克风等权限

## 快速开始

1. **环境准备**  
   - 安装鸿蒙开发环境（DevEco Studio 及相关SDK）
   - 克隆本项目到本地

2. **安装依赖**  
   ```
   # 进入项目根目录
   npm install
   ```

3. **运行项目**  
   - 使用 DevEco Studio 打开项目
   - 选择模拟器或真机，点击运行

## 主要页面与组件

- `views/ChatPage.ets`：聊天主界面，支持文本、语音、表情等多种消息类型
- `component/ListChatContentLeftItem.ets`、`ListChatContentRightItem.ets`：聊天气泡组件
- `utils/AudioCapturerManager.ets`：录音管理器，负责录音文件的生成与时长计算
- `utils/SpeechRecognizerManager.ets`：语音识别管理器
- `views/Login.ets`、`Register.ets`：登录与注册页面
- `views/Main.ets`、`Start.ets`：应用主入口与启动页
- `pages/contact/Contact.ets`：联系人管理页面
- `pages/CirclePage.ets`：朋友圈动态页面

## 贡献指南

1. Fork 本仓库
2. 新建分支（如：feat_xxx）
3. 提交代码
4. 发起 Pull Request

## 其他说明

- 本项目仅用于学习与交流，禁止用于商业用途。
- 欢迎提交 Issue 与 PR，共同完善项目。 



