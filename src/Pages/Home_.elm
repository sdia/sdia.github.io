module Pages.Home_ exposing (view)

-- import Html

import Element exposing (..)
import Page exposing (Page)
import Request exposing (Request)
import Shared
import UI
import View exposing (View)


view : View msg
view =
    { title = "Homepage"
    , element =
        UI.layout
            [ row [] [ text "Homepage" ]
            , paragraph [] [ text "This homepage is just a view function, click the links in the navbar to see more pages!" ]
            ]
    }
