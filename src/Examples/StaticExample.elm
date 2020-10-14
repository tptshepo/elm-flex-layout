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
    , style "border-radius" "3px"
    , style "color" "#fff"
    , style "text-align" "center"
    , style "padding" "8px"
    , style "box-shadow" "0 2px 5px 0 rgba(52,47,51,.63)"
    , style "font-size" "14px"
    , style "font-family" "Roboto, Helvetica Neue, sans-serif"
    , style "background-color" backgroundColor
    ]


main : Html msg
main =
    let
        direction : Direction
        direction =
            Flex.row
    in
    div
        ([ style "height" "402px"
         , style "border" "1px solid gray"
         , style "margin" "50px"
         ]
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
