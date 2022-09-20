open Promise
@val external fetch: 'a = "fetch"

module Response = {
  type t<'data>
  @send external json: t<'data> => Promise.t<'data> = "json"
}

let url = "https://jsonplaceholder.typicode.com/users"
type user = {id: int, username: string, email: string, phone: string, website: string}

let parseJSON = res => {
  res->Response.json
}

let logData = (data: user) => {
  data->resolve
}

let getUser = userId => {
  fetch(`${url}/${Belt.Int.toString(userId)}`)
  ->then(parseJSON)
  ->then((data: user) => {
    data->resolve
  })
}

let getUsers = () => {
  fetch(url)->then(parseJSON)
}
