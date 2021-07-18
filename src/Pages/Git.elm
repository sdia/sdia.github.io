module Pages.Git exposing (Model, Msg, page)

-- import Html exposing (Html)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Gen.Params.Element exposing (Params)
import GitUtils.ColorSummer exposing (..)
import GitUtils.Question as Question exposing (Answer, Question, questionGenerator)
import GitUtils.QuestionsBasic as QuestionsBasic exposing (questions)
import Html exposing (Html)
import Html.Events
import Json.Decode as Decode
import Page
import Random
import Request
import Shared
import UI
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    { question : Maybe Question
    , feedback : String
    , current_answer : String
    , current_answer_status : AnswerStatus
    , show_solution : Bool
    , next_question_enabled : Bool
    }


init : ( Model, Cmd Msg )
init =
    let
        model =
            { question = Nothing
            , feedback = ""
            , current_answer = ""
            , current_answer_status = NotCorrect
            , show_solution = False
            , next_question_enabled = False
            }
    in
    ( model
      -- , Cmd.none
    , Random.generate NewQuestion (questionGenerator questions)
    )



-- UPDATE


type Msg
    = NewQuestion Question
    | Answer String
    | Next
    | ShowSolution
    | EnterWasPressed


type AnswerStatus
    = Correct
    | NotCorrect


evaluate_answer : Model -> Answer -> AnswerStatus
evaluate_answer model answer =
    case model.question of
        Just question ->
            if List.member answer question.answers then
                Correct

            else
                NotCorrect

        Nothing ->
            NotCorrect


track_progress_answer : Answer -> List Answer -> Bool
track_progress_answer current_answer answers =
    List.any (String.startsWith current_answer) answers


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Next ->
            ( model
            , Random.generate NewQuestion (questionGenerator questions)
            )

        NewQuestion q ->
            ( { model
                | question = Just q
                , current_answer = ""
                , current_answer_status = NotCorrect
                , show_solution = False
                , next_question_enabled = False
              }
            , Cmd.none
            )

        Answer answer ->
            case model.current_answer_status of
                -- update model only if the answer is not correct
                NotCorrect ->
                    ( { model
                        | current_answer = answer
                        , current_answer_status = evaluate_answer model answer
                      }
                    , Cmd.none
                    )

                Correct ->
                    ( { model
                        | next_question_enabled = True
                      }
                    , Cmd.none
                    )

        ShowSolution ->
            ( { model
                | show_solution = True
                , next_question_enabled = True
              }
            , Cmd.none
            )

        EnterWasPressed ->
            if model.current_answer_status == Correct then
                ( model
                , Random.generate NewQuestion (questionGenerator questions)
                )

            else
                ( model, Cmd.none )



-- VIEW
-- view : Model -> View Msg
-- view model =
--     { title = "Git"
--     , element =
--         UI.layout
--             [ row [] [ text "Git" ]
--             ]
--     }


view : Model -> View Msg
view model =
    let
        title =
            "Daily dose of git"

        element =
            UI.layout
                [ column
                    [ width fill
                    , height fill
                    , Font.family
                        [ Font.typeface "IBM Plex Mono"
                        , Font.monospace
                        ]

                    -- , explain Debug.todo
                    ]
                    [ navBar
                    , bodyContent model
                    , footerContent
                    ]
                ]
    in
    { title = title
    , element = element
    }


navBar : Element msg
navBar =
    row [ width fill, paddingXY 40 20, spacing 20 ]
        [ column [ alignLeft ] [ text "🥣 daily dose of git" ]

        -- , column [ alignLeft ] [ text "/resources" ]
        , column [ alignRight ] [ text "/about" ]
        ]


bodyContent : Model -> Element Msg
bodyContent model =
    case model.question of
        Just question ->
            let
                make_button msg t clr =
                    Input.button
                        [ height fill
                        , Border.width 1
                        , Border.rounded 4
                        , paddingXY 20 0
                        , Background.color clr
                        , Font.color (rgb 1 1 1)
                        ]
                        { onPress = Just msg, label = text t }

                input_button_show_next =
                    if model.current_answer_status == Correct then
                        make_button Next "next >" teal

                    else if model.show_solution then
                        make_button Next "next >" teal

                    else
                        make_button ShowSolution "show" red
            in
            row
                [ width fill
                , height fill

                -- , explain Debug.todo
                ]
                [ column [ width fill, height fill ] []
                , column [ width (px 750), height fill ]
                    [ row
                        [ centerX
                        , centerY
                        , paddingXY 20 50
                        , Font.size 30
                        ]
                        [ paragraph []
                            [ question.question
                                |> capitalizeString
                                |> text
                            ]
                        ]
                    , row
                        [ centerX
                        , centerY
                        , padding 10
                        , width (px 750)
                        , spacing 20
                        ]
                        [ viewInput model question.hint model.current_answer question.answers Answer
                        , input_button_show_next
                        ]
                    ]
                , column [ width fill, height fill ] []
                ]

        Nothing ->
            column [] [ text "no questions today :(" ]


footerContent : Element msg
footerContent =
    row [ width fill, paddingXY 40 20, centerX ]
        [ column [] [ text "sdia.pyc@gmail.com" ]
        , column [ alignRight ] [ text "/resources" ]
        ]


viewInput : Model -> String -> String -> List Answer -> (String -> Msg) -> Element Msg
viewInput model hint current_answer answers toMsg =
    let
        dStyle =
            let
                answer_status =
                    evaluate_answer model current_answer
            in
            case answer_status of
                Correct ->
                    Font.color green

                NotCorrect ->
                    if track_progress_answer current_answer answers then
                        Font.color gray_dark

                    else
                        Font.color red

        answer_to_show =
            if model.show_solution then
                case List.head answers of
                    Just answer ->
                        answer

                    Nothing ->
                        "could not find answer :("

            else
                current_answer

        show_continue_message =
            if model.current_answer_status == Correct then
                el
                    [ Font.color gray_light
                    , Font.size 15
                    , moveUp 10
                    , alignRight
                    ]
                    (text "excellent!, press enter to continue")

            else
                Element.none

        show_alternative_answers =
            if model.current_answer_status == Correct then
                if List.length answers <= 1 then
                    Element.none

                else
                    let
                        answers_not_selected =
                            List.filter
                                (\o ->
                                    if o == current_answer then
                                        False

                                    else
                                        True
                                )
                                answers
                    in
                    row
                        [ Font.size 15
                        , moveDown 10

                        -- , explain Debug.todo
                        ]
                        [ column
                            [ alignTop, Font.color gray_light ]
                            [ text "alternative solution    " ]
                        , column []
                            (answers_not_selected
                                |> List.map (\o -> "~$ " ++ o)
                                |> List.map text
                                |> List.map (\o -> [ o ])
                                |> List.map (\o -> row [ Font.color teal ] o)
                            )
                        ]

            else
                Element.none
    in
    -- input
    Input.text
        [ dStyle
        , width fill
        , onEnter EnterWasPressed
        , centerX
        , Font.family
            [ Font.typeface "IBM Plex Mono"
            , Font.monospace
            ]
        , above
            show_continue_message
        , below
            show_alternative_answers
        ]
        { onChange = toMsg --\o -> toMsg o
        , text = answer_to_show
        , placeholder = Just (Input.placeholder [ Font.color gray_light ] (text hint))
        , label = Input.labelHidden "label"
        }



--------------


onEnter : msg -> Element.Attribute msg
onEnter msg =
    Element.htmlAttribute
        (Html.Events.on "keyup"
            (Decode.field "key" Decode.string
                |> Decode.andThen
                    (\key ->
                        if key == "Enter" then
                            Decode.succeed msg

                        else
                            Decode.fail "Not the enter key"
                    )
            )
        )


capitalizeString : String -> String
capitalizeString s =
    let
        ts =
            String.trim s

        head_s =
            ts |> String.left 1 |> String.toUpper

        tail_s =
            String.dropLeft 1 ts
    in
    head_s ++ tail_s
