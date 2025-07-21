import { AgentModel } from "../model/AgentModel";
import { ClassifyModel } from "../model/ClassifyModel";
import { getNormal } from "../util/HttpUtil";

export const getClassify = ()=>getNormal<ClassifyModel[]>("/classify/list")

interface GetAgentParam {
  page?:number
  classifyId?:number
}
export const getAgents = (page:number,classifyId:number)=>{
  let param:GetAgentParam = {
    page,
    classifyId
  }
  return getNormal<AgentModel[]>(`/agent/list`,param)
}