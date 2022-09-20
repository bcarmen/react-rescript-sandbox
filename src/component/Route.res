type t = 
| Home
| Home2

let getRouteName = (url: RescriptReactRouter.url) => switch url.path {
    | list{} => ""
    | list{hd, ...rest} => hd
}

let useRoute: unit => t = () => {
  let url = RescriptReactRouter.useUrl()
  
  switch url -> getRouteName-> Js.String2.toLowerCase {
    | "home" => Home
    | _ => Home2
  }
}
