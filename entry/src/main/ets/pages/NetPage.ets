import axios, { AxiosResponse } from '@ohos/axios'

interface IUser{
    email:string,
    password:string
}
export interface ResponseDao<T> {
    success: boolean;
    message: string;
    code: string;
    data: T;
}
export interface IUserInfo {
    id: string; // 用户id
    email: string; // 邮箱
    nickname: string; // 昵称
    gender: number; // 性别
    avatar: string; // 头像
    createdAt?: string;
    introduction?: string;
    birthday?: string;
}

export interface IUserDao {
    userInfo: IUserInfo;
    token: string;
}

@Entry
@Component
struct NetPage {
    build() {
        Column() {
            Text('网络通讯测试')
                .fontSize($r('app.float.page_text_font_size'))
                .fontWeight(FontWeight.Bold)
            Button('发送网络请求')
                .onClick(() => {
                    this.NetRequest()
                })
        }
        .height('100%')
        .width('100%')
    }
    NetRequest() {
        const user:IUser = {
            email:"zhousir@qq.com",
            password:"123456"
        }
        axios({
            method:"POST",
            url:"http://47.109.74.84:9999/ddchat/index/login",
            data:user
        }).then((res: AxiosResponse<ResponseDao<IUserDao>>)=>{
            console.log(JSON.stringify(res))
            const data:ResponseDao<IUserDao> = res.data
            if(data.code == "S1"){
                console.log(data.data.userInfo.nickname)
            }
        })
    }
}