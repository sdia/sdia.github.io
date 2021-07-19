module UI exposing (bodyFont, h1, layout)

-- import Html exposing (Html)
-- import Html.Attributes as Attr

import Element exposing (..)
import Element.Border as Border
import Element.Font as Font
import Gen.Route as Route exposing (Route)


bodyFont : Int
bodyFont =
    24


layout : String -> List (Element msg) -> Element msg
layout titleNav children =
    let
        viewLink : String -> Route -> Element msg
        viewLink label route =
            link []
                { url = Route.toHref route
                , label = text label
                }
    in
    column
        [ width fill
        , height fill
        , Font.family
            [ Font.typeface "IBM Plex Mono"
            , Font.monospace
            ]
        , Font.size bodyFont

        -- , explain Debug.todo
        ]
        [ row
            [ width fill
            , paddingXY 40 20
            , spacing 20

            -- , explain Debug.todo
            ]
            [ column [ alignLeft ] [ text titleNav ]
            , column [ alignRight ] [ viewLink "/about" Route.Home_ ]

            -- , column [ alignLeft ] [ viewLink "Static" Route.Static ]
            -- , column [ alignLeft ] [ viewLink "Sandbox" Route.Sandbox ]
            -- , column [ alignLeft ] [ viewLink "Element" Route.Element ]
            -- , column [ alignLeft ] [ viewLink "Advanced" Route.Advanced ]
            -- , column [ alignRight ] [ viewLink "Dynamic: Apple" (Route.Dynamic__Name_ { name = "apple" }) ]
            -- , column [ alignRight ] [ viewLink "Dynamic: Banana" (Route.Dynamic__Name_ { name = "banana" }) ]
            ]

        -- main
        , row
            [ width fill
            , height fill
            ]
            children

        -- footer
        , row
            [ width fill
            , paddingXY 40 20
            , spacing 20
            , Border.widthXY 0 1
            , Border.color (rgb255 186 186 186)

            -- , explain Debug.todo
            ]
            [ column [ alignLeft ]
                [ row [ alignLeft ] [ viewLink "/home" Route.Home_ ]
                , row [ alignLeft ] [ viewLink "/git" Route.Git ]
                , row [ alignLeft ] [ viewLink "/kubectl" Route.Kubectl ]

                -- , row [ alignLeft ] [ viewLink "Static" Route.Static ]
                -- , row [ alignLeft ] [ viewLink "Sandbox" Route.Sandbox ]
                -- , row [ alignLeft ] [ viewLink "Element" Route.Element ]
                -- , row [ alignLeft ] [ viewLink "Advanced" Route.Advanced ]
                -- , row [ alignLeft ] [ viewLink "Dynamic: Apple" (Route.Dynamic__Name_ { name = "apple" }) ]
                -- , row [ alignLeft ] [ viewLink "Dynamic: Banana" (Route.Dynamic__Name_ { name = "banana" }) ]
                ]
            ]
        ]


h1 : String -> Element msg
h1 label =
    el [] (text label)
