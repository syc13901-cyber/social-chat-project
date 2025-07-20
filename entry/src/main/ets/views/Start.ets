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
                                this.pageInfos.pushPathByName("Register",null,false)
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