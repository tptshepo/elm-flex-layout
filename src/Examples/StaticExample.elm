module Examples.StaticExample exposing (..)

import Flex exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


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


viewBoxContainer : Direction -> Html msg
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


viewPageTitleContainer : Html msg
viewPageTitleContainer =
    div ([ class "page-title" ] ++ fxLayout Flex.column Flex.stretch Flex.start)
        [ div ([ style "height" "50px" ] ++ fxLayout Flex.row Flex.start Flex.center)
            [ h5 [ style "margin-right" "20px" ] [ text "Elm Flex Layout Demos:" ]
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


main : Html msg
main =
    let
        direction : Direction
        direction =
            Flex.row
    in
    div [ class "container" ]
        [ br [] []
        , viewPageTitleContainer
        , br [] []
        , div [ class "card" ]
            [ div [ class "card-body" ]
                [ h5 [ class "card-title" ] [ text "Layout Children with 'fxLayout'" ]
                , viewBoxContainer direction
                ]
            ]
        ]
