import { CommonTitle } from "./UIComponent"
import { photoAccessHelper } from "@kit.MediaLibraryKit";
import { fileIo } from "@kit.CoreFileKit";
import axios, { AxiosResponse, FormData } from "@ohos/axios";
import { ResponseDao } from "../pages/NetPage";
import { IAccount, IAvage } from "../model/APIModel";
import { promptAction } from "@kit.ArkUI";

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
    @State avatarFile: string = '' // 服务返回头像地址

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
                        if(result.photoUris.length > 0){
                            this.avatar = result.photoUris[0]
                            // 上传头像到服务器
                            this.updataAvatar(result.photoUris[0])
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
                        .backgroundColor(this.gender == '男' ? '#ffc08af6' : '#ffffff')
                        .fontColor(this.gender == '男' ? '#ffffff' : '#000000')
                        .onClick(() => {
                            this.gender = '男'
                        })

                    Button('女生', { type: ButtonType.Normal, stateEffect: true })
                        .width('45%')
                        .height(47)
                        .borderRadius(4)
                        .backgroundColor(this.gender == '女' ? '#ffc08af6' : '#ffffff')
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
                    Checkbox().selectedColor('#ffc08af6')
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
                    .backgroundColor('#ffc08af6')
                    .borderRadius(4)
                    .fontWeight(500)
                    .margin({ top: 43 })
                    .onClick( () => {
                        // 请求参数
                        const account:IAccount = {
                            email:this.email,
                            nickname:this.nickname,
                            gender:this.gender,
                            password1:this.password,
                            password2:this.confirmPassword,
                            avatar:this.avatarFile
                        }

                        // 调用注册接口，用户注册
                        axios({
                            method:"POST",
                            url:"http://47.109.74.84:9999/ddchat/index/register",
                            data:account
                        }).then((res: AxiosResponse<ResponseDao<string>>)=>{
                            const data:ResponseDao<string> = res.data
                            if(data.code == "S1"){
                                promptAction.showToast({message:'注册成功!'})
                            }else{
                                promptAction.showToast({message:data.message})
                            }
                        })

                    })

            }.width('100%').height('100%')
            .backgroundColor('#f5f5f5')
        }.hideTitleBar(true)
    }

    /**
     * 头像上传
     */
    updataAvatar(fileUrl:string){
        // 保存头像到鸿蒙应用沙箱缓存
        const file = fileIo.openSync(fileUrl,fileIo.OpenMode.READ_ONLY)
        const filePath = getContext().cacheDir + '/' + file.name
        fileIo.copyFileSync(file.fd,filePath)  // 拷贝文件
        fileIo.closeSync(file.fd)

        // 构造FormData对象
        const formData = new FormData()
        const userID = Math.floor(Math.random() * 1000000)
        formData.append('userId',userID+'')
        formData.append('image',`internal://cache/${file.name}`)

        // 调用头像上传接口完成头像上传
        axios({
            method:"POST",
            url:"http://47.109.74.84:9999/ddchat/image/uploadAvatar",
            data:formData,
            headers:{
                'Content-Type':'multipart/form-data'
            },
            context:getContext()
        }).then((res: AxiosResponse<ResponseDao<IAvage>>)=>{
            console.log(JSON.stringify(res))
            const data:ResponseDao<IAvage> = res.data
            console.log(JSON.stringify(data))
            if(data.code == "S1"){
                this.avatarFile = '/'+data.data.url // /resource/image/avatar-of-user-916687.png
            }
        })
    }
}