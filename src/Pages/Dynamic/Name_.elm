module Pages.Dynamic.Name_ exposing (page)

-- import Html exposing (Html)

import Element exposing (..)
import Gen.Params.Dynamic.Name_ exposing (Params)
import Page exposing (Page)
import Request
import Shared
import UI
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page
page _ req =
    Page.static
        -- 👇 we pass in params here
        { view = view req.params
        }


view : Params -> View msg
view params =
    { title = "Dynamic: " ++ params.name
    , element =
        UI.layout ("Dynamic: " ++ params.name)
            [ UI.h1 "Dynamic Page"
            , row [] [ text params.name ]
            ]
    }
