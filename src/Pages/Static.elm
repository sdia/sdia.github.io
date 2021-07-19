module Pages.Static exposing (page)

-- import Html exposing (Html)

import Element exposing (..)
import Gen.Params.Static exposing (Params)
import Page exposing (Page)
import Request
import Shared
import UI
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page
page shared req =
    Page.static
        { view = view
        }


view : View msg
view =
    { title = "Static"
    , element =
        UI.layout "Static"
            [ column [] [ text "Static" ]
            ]
    }
