module Examples.LayoutAlign exposing (..)

import Flex exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


blockStyles : String -> List (Attribute msg)
blockStyles backgroundColor =
    [ style "min-height" "75px"
    , style "min-width" "50px"
    , style "border-radius" "3px"
    , style "color" "#fff"
    , style "text-align" "center"
    , style "padding" "5px"
    , style "font-size" "14px"
    , style "font-family" "Roboto, Helvetica Neue, sans-serif"
    , style "background-color" backgroundColor
    ]


main : Html msg
main =
    div
        ([ style "height" "200px"
         , style "border" "1px solid gray"
         , style "margin" "50px"
         ]
            ++ fxLayout Flex.row Flex.start Flex.stretch
        )
        [ div
            ([] ++ blockStyles "#009688")
            [ text "1" ]
        , div
            ([] ++ blockStyles "#3949ab")
            [ text "2" ]
        , div
            ([] ++ blockStyles "#9c27b0")
            [ text "3" ]
        ]
