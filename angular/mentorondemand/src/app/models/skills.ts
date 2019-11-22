export interface skills
{
    skId?:number
    skName?:string
    skToc?:string
    skDuration?:number
    skPrerequistes?:string

}

export interface mentorskills
{
    msId?:number
    msMid?:number
    msSid?:number
    msSelfrating?:number
    msYearsofexperience?:number
    msTrainingdelivered?:string
    msFacilitiesoffered?:string
}
export interface mentorskillsadd
{
    msSid?:number
    msSelfrating?:number
    msYearsofexperience?:number
}

