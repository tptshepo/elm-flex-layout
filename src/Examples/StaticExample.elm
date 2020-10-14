module Examples.StaticExample exposing (..)

import Browser
import Flex exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events exposing (..)



-- Model


type alias LayoutModel =
    { direction : Direction
    }


init : () -> ( LayoutModel, Cmd Msg )
init _ =
    ( { direction = Flex.row }, Cmd.none )



-- Update


type Msg
    = LayoutDirection Direction Bool


update : Msg -> LayoutModel -> ( LayoutModel, Cmd Msg )
update msg model =
    case msg of
        LayoutDirection direction checked ->
            ( { model | direction = direction }, Cmd.none )



-- Views


blockStyles : Direction -> String -> String -> String -> String -> String -> List (Attribute msg)
blockStyles direction backgroundColor rowMinWidth rowMinHeight colMinWidth colMinHeight =
    let
        minWidth =
            if direction == Flex.row then
                rowMinWidth

            else
                colMinWidth

        minHeight =
            if direction == Flex.row then
                rowMinHeight

            else
                colMinHeight
    in
    [ style "min-width" minWidth
    , style "min-height" minHeight
    , style "background-color" backgroundColor
    , class "box-item"
    ]


viewBoxContainer : Direction -> Html Msg
viewBoxContainer direction =
    div
        ([ class "box-container" ]
            ++ fxLayout direction Flex.spaceAround Flex.center
        )
        [ div
            ([] ++ blockStyles direction "#009688" "75px" "50px" "75px" "50px")
            [ text "1" ]
        , div
            ([]
                ++ blockStyles direction "#3949ab" "75px" "100px" "125px" "50px"
            )
            [ text "2" ]
        , div
            ([] ++ blockStyles direction "#9c27b0" "75px" "50px" "75px" "50px")
            [ text "3" ]
        , div
            ([]
                ++ blockStyles direction "#b08752" "75px" "75px" "100px" "50px"
            )
            [ text "4" ]
        , div
            ([] ++ blockStyles direction "#5ca6b0" "75px" "50px" "75px" "50px")
            [ text "5" ]
        ]


viewPageTitleContainer : Html Msg
viewPageTitleContainer =
    div ([ class "page-title" ] ++ fxLayout Flex.column Flex.stretch Flex.start)
        [ div ([ style "height" "50px" ] ++ fxLayout Flex.row Flex.start Flex.center)
            [ h5 [ style "margin-right" "20px" ] [ text "Elm Flex Layout Demo:" ]
            , span [] [ text "Version: 0.0.1" ]
            ]
        , div [ style "height" "50px" ]
            [ span []
                [ text "This Elm package is inspired by the "
                , a [ href "https://tburleson-layouts-demos.firebaseapp.com" ] [ text "Angular Flex Layout library" ]
                , text ". My goal is to port as many features as I can from that library to Elm."
                ]
            ]
        ]


viewTogglesContainer : Html Msg
viewTogglesContainer =
    div
        ([ class "toggle-container" ]
            ++ fxLayout Flex.row Flex.spaceAround Flex.start
        )
        [ viewToggleDirectionContainer
        , div
            ([]
                ++ blockStyles Flex.row "#3949ab" "75px" "100px" "125px" "50px"
            )
            [ text "2" ]
        , div
            ([] ++ blockStyles Flex.row "#9c27b0" "75px" "50px" "75px" "50px")
            [ text "3" ]
        ]


viewToggleDirectionContainer : Html Msg
viewToggleDirectionContainer =
    div
        ([ class "toggle-item-container" ]
            ++ fxLayout Flex.column Flex.stretch Flex.start
        )
        [ span [] [ text "Layout Direction" ]
        , br [] []
        , div []
            [ viewRadioButton "direction" "Row" "row" True (LayoutDirection Flex.row)
            , viewRadioButton "direction" "Column" "column" False (LayoutDirection Flex.column)
            ]
        ]


viewRadioButton : String -> String -> String -> Bool -> (Bool -> Msg) -> Html Msg
viewRadioButton group innerText innerValue innerChecked onCheckMsg =
    div [ class "form-check" ]
        [ input
            [ class "form-check-input"
            , Attr.type_ "radio"
            , name group
            , value innerValue
            , checked innerChecked
            , onCheck onCheckMsg

            -- , on Change
            ]
            []
        , label [ class "form-check-label" ] [ text innerText ]
        ]


view : LayoutModel -> Html Msg
view model =
    div [ class "container" ]
        [ br [] []
        , viewPageTitleContainer
        , br [] []
        , div [ class "card" ]
            [ div [ class "card-body" ]
                [ h5 [ class "card-title" ] [ text "Layout Children with 'fxLayout'" ]
                , div ([] ++ fxLayout Flex.column Flex.stretch Flex.start)
                    [ viewBoxContainer model.direction
                    , viewTogglesContainer
                    ]
                ]
            ]
        ]


main : Program () LayoutModel Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
