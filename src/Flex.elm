module Flex exposing
    ( fxLayout, fxRow, fxColumn, alignmentToString
    , Direction, row, column
    , Alignment, start, end, center, stretch, spaceBetween, spaceAround, spaceEvenly
    )

{-| Flex provides a layout API for using Flexbox CSS.

Demo
<https://tptshepo.github.io/elm-flex-layout>


# API

@docs fxLayout, fxRow, fxColumn, alignmentToString


# Direction

@docs Direction, row, column


# Alignment

@docs Alignment, start, end, center, stretch, spaceBetween, spaceAround, spaceEvenly

-}

import Html exposing (Attribute)
import Html.Attributes exposing (style)


{-| This establishes the main-axis, thus defining the direction flex items are placed in the flex container.
-}
type Direction
    = Row
    | Column


{-| `row`: This establishes the main-axis, thus defining the direction flex items are placed in the flex container.
-}
row : Direction
row =
    Row


{-| `column`: Same as row but top to bottom
-}
column : Direction
column =
    Column


{-| This defines the alignment along the main axis. It helps distribute extra free space leftover when either all the flex items on a line are inflexible, or are flexible but have reached their maximum size. It also exerts some control over the alignment of items when they overflow the line.
-}
type Alignment
    = Start
    | Center
    | End
    | SpaceBetween
    | SpaceAround
    | SpaceEvenly
    | Stretch


{-| Return a string version of the `Alignment` type
-}
alignmentToString : Alignment -> String
alignmentToString alignment =
    case alignment of
        Start ->
            "start"

        Center ->
            "center"

        End ->
            "end"

        SpaceBetween ->
            "spaceBetween"

        SpaceAround ->
            "spaceAround"

        SpaceEvenly ->
            "spaceEvenly"

        Stretch ->
            "stretch"


{-| `flex-start` items are placed at the start of the cross axis. The difference between these is subtle, and is about respecting the flex-direction rules.
-}
start : Alignment
start =
    Start


{-| `center` items are centered in the cross-axis.
-}
center : Alignment
center =
    Center


{-| `flex-end` items are placed at the end of the cross axis. The difference again is subtle and is about respecting flex-direction rules.
-}
end : Alignment
end =
    End


{-| `stretch` to fill the container (still respect min-width/max-width)
-}
stretch : Alignment
stretch =
    Stretch


{-| `space-between` items are evenly distributed in the line; first item is on the start line, last item on the end line.
-}
spaceBetween : Alignment
spaceBetween =
    SpaceBetween


{-| `space-around` items are evenly distributed in the line with equal space around them. Note that visually the spaces aren’t equal, since all the items have equal space on both sides. The first item will have one unit of space against the container edge, but two units of space between the next item because that next item has its own spacing that applies.
-}
spaceAround : Alignment
spaceAround =
    SpaceAround


{-| `space-evenly` items are distributed so that the spacing between any two items (and the space to the edges) is equal.
-}
spaceEvenly : Alignment
spaceEvenly =
    SpaceEvenly


{-| Shorthad for `fxLayout Flex.row`.

    Example

    div ([] ++ fxRow Flex.spaceAround Flex.center)
        [ div [] [ text "1" ]
        , div [] [ text "2" ]
        , div [] [ text "3" ]
        , div [] [ text "4" ]
        , div [] [ text "5" ]
        ]

-}
fxRow : Alignment -> Alignment -> List (Attribute msg)
fxRow =
    fxLayout row


{-| Shorthad for `fxLayout Flex.column`.

    Example

    div ([] ++ fxColumn Flex.spaceAround Flex.center)
        [ div [] [ text "1" ]
        , div [] [ text "2" ]
        , div [] [ text "3" ]
        , div [] [ text "4" ]
        , div [] [ text "5" ]
        ]

-}
fxColumn : Alignment -> Alignment -> List (Attribute msg)
fxColumn =
    fxLayout column


{-| Returns an array of `Html.Attributes.style` required to align the child items.

    Usage

    fxLayout Direction Alignment Alignment

    Example

    div ([] ++ fxLayout Flex.row Flex.spaceAround Flex.center)
        [ div [] [ text "1" ]
        , div [] [ text "2" ]
        , div [] [ text "3" ]
        , div [] [ text "4" ]
        , div [] [ text "5" ]
        ]

-}
fxLayout : Direction -> Alignment -> Alignment -> List (Attribute msg)
fxLayout direction alignHorizontal alignVertical =
    let
        flexDirection : String
        flexDirection =
            if direction == Row then
                "row"

            else
                "column"

        aHorizontal =
            -- Row
            if direction == Row then
                case alignHorizontal of
                    Start ->
                        "flex-start"

                    Center ->
                        "center"

                    End ->
                        "flex-end"

                    SpaceAround ->
                        "space-around"

                    SpaceBetween ->
                        "space-between"

                    SpaceEvenly ->
                        "space-evenly"

                    -- set to default -> flex-start
                    _ ->
                        "flex-start"

            else
                -- Column
                case alignHorizontal of
                    Start ->
                        "flex-start"

                    Center ->
                        "center"

                    End ->
                        "flex-end"

                    Stretch ->
                        "stretch"

                    -- set to default -> stretch
                    _ ->
                        "stretch"

        aVertical : String
        aVertical =
            -- Row
            if direction == Row then
                case alignVertical of
                    Start ->
                        "flex-start"

                    Center ->
                        "center"

                    End ->
                        "flex-end"

                    Stretch ->
                        "stretch"

                    -- set to default -> stretch
                    _ ->
                        "stretch"

            else
                -- Column
                case alignVertical of
                    Start ->
                        "flex-start"

                    Center ->
                        "center"

                    End ->
                        "flex-end"

                    Stretch ->
                        "stretch"

                    SpaceAround ->
                        "space-around"

                    SpaceBetween ->
                        "space-between"

                    SpaceEvenly ->
                        "space-evenly"

        defaultStyles : List (Attribute msg)
        defaultStyles =
            [ style "flex-direction" flexDirection
            , style "display" "flex"
            , style "box-sizing" "border-box"
            ]

        computedStyles : List (Attribute msg)
        computedStyles =
            -- row
            if direction == Row then
                [ style "place-content" (aVertical ++ " " ++ aHorizontal)
                , style "align-items" aVertical
                ]

            else
                -- Column
                [ style "place-content" (aHorizontal ++ " " ++ aVertical)
                , style "align-items" aHorizontal
                ]

        styles =
            defaultStyles ++ computedStyles
    in
    styles
