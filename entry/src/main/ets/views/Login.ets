import { CommonTitle } from "./UIComponent";

@Builder
function LoginBuilder(){
    Login()
}

@Component
export struct Login {
    @Consume pageInfos:NavPathStack;
    @State email: string = ''
    @State password: string = ''

    build() {
        NavDestination() {
            Column() {
                // 自定义标题组件
                CommonTitle({isShowBack:true,title: '账号登录',onBack:()=>this.pageInfos.pop()})
                Column() {
                    TextInput({ placeholder: '请输入邮箱账号', text: $$this.email })
                        .width('90%')
                        .height(47)
                        .placeholderColor('#9CA3AF')
                        .backgroundColor('#FFFFFF')
                        .margin({ top: 36 })
                        .borderWidth({ bottom: 1 })
                        .borderStyle(BorderStyle.Solid)
                        .borderColor('#eef2f6')
                        .borderRadius(0)
                        .padding(0)

                    TextInput({ placeholder: '请输入密码', text: $$this.password })
                        .width('90%')
                        .height(47)
                        .placeholderColor('#9CA3AF')
                        .backgroundColor('#FFFFFF')
                        .margin({ top: 26 })
                        .borderWidth({ bottom: 1 })
                        .borderStyle(BorderStyle.Solid)
                        .borderColor('#eef2f6')
                        .borderRadius(0)
                        .padding(0)
                        .type(InputType.Password)

                    Text('请使用已验证的邮箱账号进行登录')
                        .margin({ top: 36 })
                        .fontSize(14).fontColor('#9CA3AF')
                        .width('90%')

                    Button('账户登录', { type: ButtonType.Normal, stateEffect: true })
                        .width('90%')
                        .height(47)
                        .backgroundColor('#4FD1C5')
                        .borderRadius(4)
                        .fontWeight(500)
                        .margin({ top: 43 })
                        .onClick(() => {
                            this.onLogin()
                        })
                }
                Blank()
                Row() {
                    Text('忘记密码').fontColor('#6B7280').fontSize(14)
                    Text('紧急冻结').fontColor('#6B7280').fontSize(14)
                    Text('账户帮助').fontColor('#6B7280').fontSize(14)
                }.width('90%').justifyContent(FlexAlign.SpaceBetween)
                .margin({ top: 16, bottom: 40 })

            }.width('100%').height('100%')
        }.hideTitleBar(true)

    }



    onLogin() {
        // 如果登录成功，则跳转到主页
        this.pageInfos.pushPathByName("Main",null,false)

    }
}
