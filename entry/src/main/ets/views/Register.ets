import { CommonTitle } from "./UIComponent"
import { photoAccessHelper } from "@kit.MediaLibraryKit";

@Builder
function RegisterBuilder() {
    Register()
}

@Component
export struct Register {
    @Consume pageInfos: NavPathStack;
    @State avatar: string = '' // 预览头像地址
    @State nickname: string = '' //昵称
    @State gender: string = '男' //性别
    @State email: string = '' //邮箱
    @State password: string = ''
    @State confirmPassword: string = ''
    @State isSelect: boolean = false // 协议是否选中
    avatarUrl: string = '' // 头像地址

    selectOptions: photoAccessHelper.PhotoSelectOptions = {
        MIMEType: photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE,
        maxSelectNumber: 1,
        isPhotoTakingSupported: true
    }

    build() {
        NavDestination() {
            Column() {
                // 自定义标题组件
                CommonTitle({isShowBack:true,title: '注册账号',onBack:()=>{
                    this.pageInfos.pop()
                }})

                // 标题
                Button({ type: ButtonType.Circle, stateEffect: true }) {
                    if (this.avatar == '') {
                        Image($r('app.media.camera')).width(24).height(21)
                    } else {
                        Image(this.avatar).width(120).height(120).borderRadius(60)
                    }
                }
                .width(120)
                .height(120)
                .borderRadius(60)
                .backgroundColor('#eeeeee')
                .margin({ top: 40 })
                .onClick(() => {
                    // 获取图片
                    const photoPiker = new photoAccessHelper.PhotoViewPicker()
                    photoPiker.select(this.selectOptions).then((result)=>{
                        console.log('result ',JSON.stringify( result))
                        if(result.photoUris.length > 0){
                            this.avatar = result.photoUris[0]
                        }
                    })
                })

                TextInput({ text: $$this.nickname, placeholder: '请输入昵称' })
                    .width('90%')
                    .height(47)
                    .placeholderColor('#9CA3AF')
                    .backgroundColor('#FFFFFF')
                    .borderRadius(4)
                    .margin({ bottom: 16, top: 16 })

                Row() {
                    Button('男生', { type: ButtonType.Normal, stateEffect: true })
                        .width('45%')
                        .height(47)
                        .borderRadius(4)
                        .backgroundColor(this.gender == '男' ? '#92DEC5' : '#ffffff')
                        .fontColor(this.gender == '男' ? '#ffffff' : '#000000')
                        .onClick(() => {
                            this.gender = '男'
                        })

                    Button('女生', { type: ButtonType.Normal, stateEffect: true })
                        .width('45%')
                        .height(47)
                        .borderRadius(4)
                        .backgroundColor(this.gender == '女' ? '#92DEC5' : '#ffffff')
                        .fontColor(this.gender == '女' ? '#ffffff' : '#000000')
                        .onClick(() => {
                            this.gender = '女'
                        })
                }.width('90%')
                .margin({ bottom: 16 })
                .justifyContent(FlexAlign.SpaceBetween)

                TextInput({ text: $$this.email, placeholder: '请输入邮箱' })
                    .width('90%')
                    .height(47)
                    .placeholderColor('#9CA3AF')
                    .backgroundColor('#FFFFFF')
                    .borderRadius(4)
                    .margin({ bottom: 16 })


                TextInput({ text: $$this.password, placeholder: '请输入密码' })
                    .width('90%')
                    .height(47)
                    .placeholderColor('#9CA3AF')
                    .backgroundColor('#FFFFFF')
                    .borderRadius(4)
                    .margin({ bottom: 16 })
                    .type(InputType.Password)

                TextInput({ text: $$this.confirmPassword, placeholder: '请输入确定密码' })
                    .width('90%')
                    .height(47)
                    .placeholderColor('#9CA3AF')
                    .backgroundColor('#FFFFFF')
                    .borderRadius(4)
                    .margin({ bottom: 26 })
                    .type(InputType.Password)

                Row() {
                    Checkbox().selectedColor('#92dec5')
                        .select(this.isSelect).onChange((value: boolean) => {
                        this.isSelect = value
                    })
                    Text('我已经阅读并同意《软件许可及服务协议》本页\n' +
                        '面手机的信息仅用于注册账号 ')
                        .fontSize(14).fontColor('#4B5563')
                }

                Button('同意并注册', { type: ButtonType.Normal, stateEffect: true })
                    .width('90%')
                    .height(47)
                    .backgroundColor('#4FD1C5')
                    .borderRadius(4)
                    .fontWeight(500)
                    .margin({ top: 43 })
                    .onClick(async () => {


                    })

            }.width('100%').height('100%')
            .backgroundColor('#f5f5f5')
        }.hideTitleBar(true)
    }
}