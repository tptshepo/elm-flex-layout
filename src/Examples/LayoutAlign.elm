module Examples.LayoutAlign exposing (..)

import Flex exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


blockStyles : String -> String -> String -> List (Attribute msg)
blockStyles backgroundColor minWidth minHeight =
    [ style "min-height" minHeight
    , style "min-width" minWidth
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
            Flex.column
    in
    div
        ([ style "height" "402px"
         , style "border" "1px solid gray"
         , style "margin" "50px"
         ]
            ++ fxLayout direction Flex.spaceAround Flex.stretch
        )
        [ div
            ([] ++ blockStyles "#009688" "75px" "50px")
            [ text "1" ]
        , div
            ([]
                ++ blockStyles
                    "#3949ab"
                    (if direction == Flex.row then
                        "75px"

                     else
                        "125px"
                    )
                    (if direction == Flex.row then
                        "100px"

                     else
                        "50px"
                    )
            )
            [ text "2" ]
        , div
            ([] ++ blockStyles "#9c27b0" "75px" "50px")
            [ text "3" ]
        , div
            ([]
                ++ blockStyles "#b08752"
                    (if direction == Flex.row then
                        "75px"

                     else
                        "100px"
                    )
                    (if direction == Flex.row then
                        "75px"

                     else
                        "50px"
                    )
            )
            [ text "4" ]
        , div
            ([] ++ blockStyles "#5ca6b0" "75px" "50px")
            [ text "5" ]
        ]
