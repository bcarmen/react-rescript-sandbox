module Auth0Provider = {
  @react.component @module("@auth0/auth0-react")
  external make: (
    ~domain: string,
    ~clientId: string,
    ~redirectUri: string,
    ~scope: string,
    ~audience: string,
    ~children: React.element,
  ) => React.element = "Auth0Provider"
}

let origin = %raw(`
  window.location.origin
`)

@val @scope("import.meta.env") external domain: string = "VITE_DOMAIN"
@val @scope("import.meta.env") external clientId: string = "VITE_CLIENT_ID"
@val @scope("import.meta.env") external scope: string = "VITE_SCOPE"
@val @scope("import.meta.env") external audience: string = "VITE_AUDIENCE"

@react.component
let make = () => {
  let (state, setState) = React.useState(_ => list{})

  let fetchUsers = () => {
    let r = Users.getUsers()->Promise.then(users => {
      setState(_ => users)
      users->Js.log
      users->Promise.resolve
    })
  }

  React.useEffect0(() => {
    fetchUsers()

    None // or Some(() => {})
  })



  <Auth0Provider
    domain
    clientId
    redirectUri=origin
    scope
    audience>
    <div>
      {"Hello React"->React.string}
      <Child />
      <User users={state} />
    </div>
  </Auth0Provider>
}
