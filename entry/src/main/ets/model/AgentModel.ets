import { ClassifyModel } from "./ClassifyModel"

export class AgentModel {
  id?:number

  icon?:ResourceStr

  name?:string

  descs?:string

  ratio?:number

  downloadCount?:number

  classify?:ClassifyModel

  url?:string

}