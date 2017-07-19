import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)

import Helper as Hp

main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }

-- MODEL
type alias Model =
  { name : String
  , showMessage : Bool
  }

model : Model
model =
  Model "" False

-- UPDATE
type Msg
    = Name String | ShowMessage

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }
    ShowMessage ->
      { model | showMessage = True }

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "Name", onInput Name ] []
    , button [ onClick ShowMessage ] [Html.text "<3"]
    , printMessage model
    ]

printMessage : Model -> Html msg
printMessage model =
  let
    (color, name) =
      ("red", model.name)
  in
    if model.name /= "" && model.showMessage then
     Hp.showMessage(color, name)
    else
     div [][]