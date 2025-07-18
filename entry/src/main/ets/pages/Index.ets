/**
 *  ArtTs基础语法:
 *   1.数据类型
 *    基本数据类型
 *     string 字符串类型
 *         "hello"   'world'
 *     number 数值类型
 *         100
 *     boolean  布尔类型
 *         true  false
 *     undefined 未定义类型
 *     null  空类型
 *      ...
 *
 *    复杂类型
 *      数组  [10,20,30]
 *            0   1  2   索引号
 *      对象  {name:'张三',age:18}
 *           左括号开始，右括号结束，里面是名称值对的集合
 *           [
 *              {name:'张三',age:18,score:99},
 *              {nane:'李四',age:18,score:99}
 *           ]
 *       ...
 *
 *
 *   2.变量
 *       语法:  变量名：数据类型 = 值;
 *             let name:string = '张三';
 *              name = '李四'
 *             let age:number = 18;
 *             let  isOk:boolean = true;
 *
 *    常量
 *       const name:string = '张三';
 *
 *
 *   3. 运算符
 *        算术运算符   + - * / %
 *        比较运算符   > < >= <= == !=
 *        逻辑运算符   && || !
 *        ...
 *
 *   4. 流程控制语句
 *     - 逻辑分支语句
 *        if(条件表达式){
 *            // 语句块
 *        }
 *        if-else
 *
 *     - 循环语句
 *        for(初始值; 循环条件；改变循环条件的语句){
 *            // 语句块
 *        }
 *        while
 *        do-while
 *    5. 函数
 *       function 函数名(形参){
 *           // 封装的语句块
 *       }
 *
 *       const 函数名 = function(){
 *
 *       }
 *
 *       箭头函数
 *        (参数)=>{
 *           语句块
 *        }
 *
 *
 () => {
 this.message = 'Welcome';
 }
 *    定义学生类
 *     class Student{
 *          name:string;
 *          age:number;
 *          constructor(_name:string,_age:string){
 *              this.name = _name
 *              this.age = _age
 *          }
 *     }
 *
 *     new Student('张三',18) // 姓名是张三年龄是18一个人
 *     new Student('李四',20)
 *
 *    interface 定义接口
 *
 * 模块的导入导出
 *    export 模块
 *    import 模块  from '模块路径'
 *
 */
import { router } from '@kit.ArkUI';


@Entry
@Component
struct Index {
    // 定义一个名为message的字符串类型变量，初始值为Hello HarmonyOS
    message: string = 'Hello harmoneyOS';

    build() {
        // Column容器组件线型布局，默认垂直排列
        Column() {
            Text(this.message)

            Text('Hello World')

            Button({ type: ButtonType.Circle }) {
                Image($r('app.media.camera'))
                    .width(20)
                    .height(20)
            }
            .width(120)
            .height(120)
            .backgroundColor('#eeeeee')

            Button('同意并注册', { type: ButtonType.Normal })
                .backgroundColor('#4fd1c5')
                .width(120)
                .height(40)
                .borderRadius(8)
                .margin({top: 20})
                .onClick(() => {
                    // 路由跳转
                    // this.getUIContext().getRouter.pushURL("")
                    router.pushUrl({url: 'pages/TestPage'})
                })


        }
        .height('100%')
        .width('100%')
    }
}