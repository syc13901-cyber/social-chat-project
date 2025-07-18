@Builder
function StartBuilder() {
    Start()
}

@Component
struct Start {
    @Consume pageInfos:NavPathStack;
    build() {
        NavDestination() {
            Column() {
                Column() {
                    Image($r('app.media.welcome')).width('100%').padding(16)

                    Column() {
                        Text('欢迎来到知聊聊天').fontSize(24).fontColor('#4B5563').fontWeight(600)
                            .margin({ top: 16, bottom: 16 })
                        Text('开启你的智能对话之旅').fontSize(14).fontColor('#4B5563')
                    }.margin({ top: 10, bottom: 20 })

                    Column() {
                        Button('注册账号', { type: ButtonType.Normal, stateEffect: true })
                            .width('90%')
                            .height(53)
                            .backgroundColor('#4FD1C5')
                            .borderRadius(4)
                            .fontWeight(500)
                            .onClick(() => {
                                this.pageInfos.pushPathByName("Register",null,false)
                            })
                        Button('登录账号', { type: ButtonType.Normal, stateEffect: true })
                            .width('90%')
                            .height(53)
                            .backgroundColor('#FFFFFF')
                            .borderRadius(4)
                            .fontWeight(500)
                            .borderColor('#10B981')
                            .borderWidth(1)
                            .borderStyle(BorderStyle.Solid)
                            .fontColor('#10B981')
                            .margin({ top: 10 })
                            .onClick(() => {
                                this.pageInfos.pushPathByName("Login",null,false)
                            })
                    }
                }
            }
            .height('100%')
            .width('100%')
        }.hideTitleBar(true)
    }
}