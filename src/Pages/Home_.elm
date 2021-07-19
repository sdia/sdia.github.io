module Pages.Home_ exposing (view)

-- import Html

import Element exposing (..)
import Element.Font as Font
import Page exposing (Page)
import Request exposing (Request)
import Shared
import UI
import View exposing (View)


view : View msg
view =
    { title = "Homepage"
    , element =
        UI.layout "🍂"
            [ column [ width fill ] []
            , column
                [ Font.family
                    [ Font.typeface "EB Garamond"
                    , Font.serif
                    ]

                -- , Font.color (rgb255 194 143 213)
                ]
                [ row [] [ el [ alignLeft, Font.size (UI.bodyFont * 3) ] (text "Hi") ]
                , row
                    [-- explain Debug.todo
                    ]
                    [ textColumn
                        [ width (px 750)

                        --, explain Debug.todo
                        , spacing 0
                        , padding 0
                        ]
                        [ --el
                          --  [ spacing 0
                          --  , padding 0
                          --  , alignLeft
                          --  , Font.size (UI.bodyFont * 5)
                          --
                          --  --                    , Font.family
                          --  --                        [ Font.typeface "EB Garamond"
                          --  --                        , Font.serif
                          --  --                        ]
                          --  , width shrink
                          --  , height shrink
                          --
                          --  --, explain Debug.todo
                          --  ]
                          --  (text "H")
                          --,
                          paragraph
                            [ width fill
                            , height fill
                            , spacing 15
                            , padding 0
                            ]
                            [ text "my name is Seydou, "
                            , text "I'm a data engineer based in Berlin with 10 years of experience in helping "
                            , text "businesses get the most value from their data. I believe the main duty of a data "
                            , text "engineer is to reduce the cost of information access. I like to build simple and "
                            , text "scalable solutions to shorten the path to insights. On a personal level, I try "
                            , text "to be a good team player, to listen more, and to be prompt to admit the limits "
                            , text "of my knowledge. I love hiking, biking on my gravel and playing piano. My dream "
                            , text "is to work for a company aiming to improve the world. In 2021, my learning goals "
                            , text "focus on the topics of consensus and commit protocols in distributed systems "
                            , text "i.e. Paxos, Raft, Blockchain."
                            ]
                        ]
                    ]
                , row
                    [ -- centerX
                      padding 40
                    , Font.size (UI.bodyFont * 4)
                    , width fill
                    , height fill

                    --, explain Debug.todo
                    ]
                    [ el [ centerX ] (text "🍂") ]
                ]
            , column [ width fill ] []
            ]
    }
