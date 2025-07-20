export interface IUser{//用户信息
    email:string,
    password:string
}
export interface ResponseDao<T> {//响应数据
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

export interface IAvage{
    compressUrl:string,
    url:string
}

export interface IAccount{
    email:string,
    nickname:string,
    gender:string,
    password1:string,
    password2:string,
    avatar?: string

}