


@module("@auth0/auth0-react")
external useAuth0: 'a = "useAuth0"

type auth = {
  isAuthenticated: bool,
  isLoading: bool,
  loginWithRedirect: () => {}
}


@react.component
let make = () => {
  let r: auth = useAuth0();

  React.useEffect2(() => {
     if (!r.isAuthenticated && !r.isLoading) {
      let l = r.loginWithRedirect()
    }

    None
  }, (r.isLoading, r.isAuthenticated))

    <div> 
      {"Child of Foo"->React.string}
    </div>
}
