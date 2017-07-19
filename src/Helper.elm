module Helper exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

msg : String
msg =
  "Oi, "

getMessage : String -> String
getMessage name =
  msg ++ name ++ "! "

showMessage : (String, String) -> Html msg
showMessage (color, message) =
  div [ style [("color", color)] ] [
    getMessage message
    |> text
  , text <| getMessage message
  , (text (getMessage message) )
  ]