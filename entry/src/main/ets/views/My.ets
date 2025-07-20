import { IUserDao } from "../pages/NetPage"
import PreferenceUtil from "../utils/PreferenceUtils"
import { CommonTitle } from "./UIComponent"
import { common } from "@kit.AbilityKit"

@Preview
@Component
export struct My {
    @State account: IUserDao = {
        userInfo: {
            id: "", // 用户id
            email: "", // 邮箱
            nickname: "", // 昵称
            gender: 0, // 性别
            avatar: "" // 头像

        },
        token: ""
    }

    async aboutToAppear() {
        // 获取用户信息
        const account: IUserDao =
            await PreferenceUtil.getPreferenceValue('ACCOUNT_PREFERENCE', 'ACCOUNT', '') as IUserDao
        console.log('account ', JSON.stringify(account))
        this.account = account
    }

    build() {
        Column() {
            CommonTitle({ title: '个人中心' })

            Column({ space: 5 }) {
                // 头部用户信息
                Row({ space: 12 }) {
                    Image('http://47.109.74.84:9999' + this.account?.userInfo?.avatar)
                        .width(64)
                        .height(64)
                        .borderRadius(32)
                    Column() {
                        Text(this.account?.userInfo?.nickname)
                            .fontSize(20)
                            .fontWeight(FontWeight.Bold)
                            .fontColor('#222')
                        Text(this.account?.userInfo?.email)
                            .fontSize(16)
                            .fontColor('#888')
                    }.alignItems(HorizontalAlign.Start)

                    Blank()
                }
                .padding({
                    top: 32,
                    bottom: 16,
                    left: 24,
                    right: 24
                })
                .width('100%')
                .backgroundColor('#fff')

                // 功能列表
                Column() {
                    // 我的相册
                    Row() {
                        Image($r('app.media.my_xiangce')).width(24).height(24)
                        Text('我的相册').fontSize(18).fontColor('#222').margin({ left: 12 })
                        Blank()
                        Text('128 张照片').fontSize(16).fontColor('#B0B0B0')
                        Image($r('app.media.my_arr')).width(18).height(18).margin({ left: 8 })
                    }.height(48).alignItems(VerticalAlign.Center).padding({ left: 24, right: 24 })
                    .width('100%')

                    Divider().color('#F0F0F0').height(1).margin({ left: 24 })
                    // 我的收藏
                    Row() {
                        Image($r('app.media.my_shouchang')).width(24).height(24)
                        Text('我的收藏').fontSize(18).fontColor('#222').margin({ left: 12 })
                        Blank()
                        Text('96 个收藏').fontSize(16).fontColor('#B0B0B0')
                        Image($r('app.media.my_arr')).width(18).height(18).margin({ left: 8 })
                    }.height(48).alignItems(VerticalAlign.Center).padding({ left: 24, right: 24 })
                    .width('100%')

                    Divider().color('#F0F0F0').height(1).margin({ left: 24 })
                    // 系统设置
                    Row() {
                        Image($r('app.media.my_seting')).width(24).height(24)
                        Text('系统设置').fontSize(18).fontColor('#222').margin({ left: 12 })
                        Blank()
                        Image($r('app.media.my_arr')).width(18).height(18).margin({ left: 8 })
                    }.height(48).alignItems(VerticalAlign.Center).padding({ left: 24, right: 24 })
                    .width('100%')
                }
                .backgroundColor('#fff')
                .margin({ top: 8 })
                .borderRadius(8)

                // 退出登录按钮
                Blank().height(32)
                Button('退出登录')
                    .width('90%')
                    .height(48)
                    .fontSize(20)
                    .fontColor('#fff')
                    .backgroundColor('#ffc08af6')
                    .borderRadius(8)
                    .margin({ left: '5%', right: '5%' })
                    .onClick(() => {
                         this.onLogout()
                    })
                Blank()
            }
            .width('100%')
            .height('100%')
            .backgroundColor('#F2FFF7')
        }
    }
    async onLogout() {
        // 清除用户信息
        PreferenceUtil.putPreferenceValue('ACCOUNT_PREFERENCE', 'ACCOUNT', '')
        // 退出
        const exit = new ExitUtil()
        exit.exitApp()
    }
}

class ExitUtil {
    private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext

    exitApp() {
        this.context.getApplicationContext().killAllProcesses()
    }
}
