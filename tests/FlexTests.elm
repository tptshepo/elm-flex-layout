module FlexTests exposing (..)

import Expect exposing (Expectation)
import Flex exposing (fxColumn, fxLayout, fxRow)
import Fuzz exposing (Fuzzer, int, list, string)
import Html
import Html.Attributes exposing (style)
import Test exposing (..)


fxRowTests : Test
fxRowTests =
    describe "fxRow"
        [ describe "fxRow ... start"
            [ test "center start" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "row"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-start center"
                            , style "align-items" "flex-start"
                            ]
                    in
                    Expect.equal styleList (fxRow Flex.center Flex.start)
            ]
        , describe "fxRow start ..."
            [ test "start end" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "row"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-end flex-start"
                            , style "align-items" "flex-end"
                            ]
                    in
                    Expect.equal styleList (fxRow Flex.start Flex.end)
            ]
        ]


fxLayoutRowTests : Test
fxLayoutRowTests =
    describe "fxLayout row"
        [ describe "fxLayout row ... start"
            [ test "start start" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "row"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-start flex-start"
                            , style "align-items" "flex-start"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.row Flex.start Flex.start)
            , test "center start" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "row"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-start center"
                            , style "align-items" "flex-start"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.row Flex.center Flex.start)
            , test "end start" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "row"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-start flex-end"
                            , style "align-items" "flex-start"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.row Flex.end Flex.start)
            , test "spaceAround start" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "row"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-start space-around"
                            , style "align-items" "flex-start"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.row Flex.spaceAround Flex.start)
            , test "spaceBetween start" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "row"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-start space-between"
                            , style "align-items" "flex-start"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.row Flex.spaceBetween Flex.start)
            , test "spaceEvenly start" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "row"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-start space-evenly"
                            , style "align-items" "flex-start"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.row Flex.spaceEvenly Flex.start)
            ]
        , describe "fxLayout row start ..."
            [ test "start center" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "row"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "center flex-start"
                            , style "align-items" "center"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.row Flex.start Flex.center)
            , test "start end" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "row"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-end flex-start"
                            , style "align-items" "flex-end"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.row Flex.start Flex.end)
            , test "start stretch" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "row"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "stretch flex-start"
                            , style "align-items" "stretch"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.row Flex.start Flex.stretch)
            ]
        ]


fxLayoutColumnTests : Test
fxLayoutColumnTests =
    describe "fxLayout column"
        [ describe "fxLayout column start ..."
            [ test "start start" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "column"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-start flex-start"
                            , style "align-items" "flex-start"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.column Flex.start Flex.start)
            , test "start center" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "column"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-start center"
                            , style "align-items" "flex-start"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.column Flex.start Flex.center)
            , test "start end" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "column"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-start flex-end"
                            , style "align-items" "flex-start"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.column Flex.start Flex.end)
            , test "start spaceAround" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "column"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-start space-around"
                            , style "align-items" "flex-start"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.column Flex.start Flex.spaceAround)
            , test "start spaceBetween" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "column"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-start space-between"
                            , style "align-items" "flex-start"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.column Flex.start Flex.spaceBetween)
            , test "start spaceEvenly" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "column"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-start space-evenly"
                            , style "align-items" "flex-start"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.column Flex.start Flex.spaceEvenly)
            ]
        , describe "fxLayout column ... start"
            [ test "center start" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "column"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "center flex-start"
                            , style "align-items" "center"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.column Flex.center Flex.start)
            , test "end start" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "column"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-end flex-start"
                            , style "align-items" "flex-end"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.column Flex.end Flex.start)
            , test "stretch start" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "column"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "stretch flex-start"
                            , style "align-items" "stretch"
                            ]
                    in
                    Expect.equal styleList (fxLayout Flex.column Flex.stretch Flex.start)
            ]
        ]


fxColumnTests : Test
fxColumnTests =
    describe "fxColumn"
        [ describe "fxColumn start ..."
            [ test "start center" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "column"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "flex-start center"
                            , style "align-items" "flex-start"
                            ]
                    in
                    Expect.equal styleList (fxColumn Flex.start Flex.center)
            ]
        , describe "fxColumn ... start"
            [ test "center start" <|
                \_ ->
                    let
                        styleList =
                            [ style "flex-direction" "column"
                            , style "display" "flex"
                            , style "box-sizing" "border-box"
                            , style "place-content" "center flex-start"
                            , style "align-items" "center"
                            ]
                    in
                    Expect.equal styleList (fxColumn Flex.center Flex.start)
            ]
        ]
