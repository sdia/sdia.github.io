module UI exposing (h1, layout)

-- import Html exposing (Html)
-- import Html.Attributes as Attr

import Element exposing (..)
import Gen.Route as Route exposing (Route)


layout : List (Element msg) -> Element msg
layout children =
    let
        viewLink : String -> Route -> Element msg
        viewLink label route =
            link []
                { url = Route.toHref route
                , label = text label
                }
    in
    column []
        [ column []
            [ row []
                [ viewLink "Static" Route.Static
                , viewLink "Sandbox" Route.Sandbox
                , viewLink "Element" Route.Element
                , viewLink "Advanced" Route.Advanced
                , viewLink "Dynamic: Apple" (Route.Dynamic__Name_ { name = "apple" })
                , viewLink "Dynamic: Banana" (Route.Dynamic__Name_ { name = "banana" })
                ]
            ]
        , column [] children
        ]


h1 : String -> Element msg
h1 label =
    el [] (text label)
