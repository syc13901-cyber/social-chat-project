@Builder
function StartBuilder() {
    Start()
}
@Entry
@Component
struct Start {
    @Consume pageInfos: NavPathStack;
    @State isRefreshing: boolean = false // 是否正在刷新
    @State promptText: string = '' // 下拉提示文字
    @State list: number[] = [] // 列表数据

    aboutToAppear(): void {
        this.getList()
    }

    getList() {
        // 模拟接口获取列表数据
        setTimeout(() => {
            this.list = [] // 清空旧数据
            for (let i = 0; i < 20; i++) {
                this.list.push(i)
            }
            this.isRefreshing = false
        }, 1000)
    }

    build() {
        NavDestination() {
            Refresh({ refreshing: $$this.isRefreshing, promptText: this.promptText }) {
                List({ space: 20 }) {
                    // 欢迎区作为第一个ListItem
                    ListItem() {
                        Column() {
                            Image($r('app.media.welcome')).width('100%').padding(16)
                            Column() {
                                Text('欢迎来到FlashMeow').fontSize(30).fontColor('#4B5563').fontWeight(600)
                                    .margin({ top: 16, bottom: 16 })
                                Text('让办公交流更轻松').fontSize(26).fontColor('#4B5563')
                            }.margin({ top: 10, bottom: 20 })
                            Column() {
                                Button('注册账号', { type: ButtonType.Normal, stateEffect: true })
                                    .width('90%')
                                    .height(53)
                                    .backgroundColor('#ffc08af6')
                                    .borderRadius(4)
                                    .fontWeight(500)
                                    .onClick(() => {
                                        this.pageInfos.pushPathByName("Register", null, false)
                                    })
                                Button('登录账号', { type: ButtonType.Normal, stateEffect: true })
                                    .width('90%')
                                    .height(53)
                                    .backgroundColor('#FFFFFF')
                                    .borderRadius(4)
                                    .fontWeight(500)
                                    .borderColor('#ffc08af6')
                                    .borderWidth(1)
                                    .borderStyle(BorderStyle.Solid)
                                    .fontColor('#ffc08af6')
                                    .margin({ top: 10 })
                                    .onClick(() => {
                                        this.pageInfos.pushPathByName("Login", null, false)
                                    })
                            }
                        }
                    }
                    // 数字列表已隐藏
                }
                .height('100%').width('100%').padding(20).backgroundColor('#f2f2f2')
            }
            .onStateChange(async (state) => {
                switch (state) {
                    case RefreshStatus.Drag:
                        this.promptText = '下拉可以刷新'
                        break;
                    case RefreshStatus.OverDrag:
                        this.promptText = '释放立即刷新'
                        break;
                    case RefreshStatus.Refresh:
                        this.promptText = "正在刷新..."
                        this.isRefreshing = true
                        this.getList()
                        break;
                }
            })
            .height('100%')
            .width('100%')
        }.hideTitleBar(true)
    }
}