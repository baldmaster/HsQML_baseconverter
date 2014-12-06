-- Simple example of binding Haskell and QML

module Main where

import Graphics.QML
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Char as C

main :: IO ()
main = do
    -- defining qml class and methods
    clazz <- newClass [
        defMethod' "ConvertToBase"
                    (\_ txt f t->
                    if txt == (T.pack "")
                    then return txt
                    else
                    let n    = T.unpack txt
                        from = read $ T.unpack f :: Int
                        to   = read $ T.unpack t :: Int
                    in return . T.pack $
                       (numeralBaseConverter n from to) :: IO Text)]
             
    -- creating new object
    ctx <- newObject clazz ()
    -- getting QML file and setting loop until window is closed
    runEngineLoop defaultEngineConfig {
        initialDocument = fileDocument "Byteconverter.qml",
        contextObject = Just $ anyObjRef ctx}
      
-- Hexadecimal digits
hex = ["a", "b", "c", "d", "e", "f"]

-- Numeral base conversion
numeralBaseConverter number from to = convertTo to "" $
                                      convertFrom from number 0 1

convertTo base result number
    | number < base  = num ++ result
    | otherwise      = convertTo base (num ++ result) (div number base)
                       where n   = rem number base
                             num = if n > 9
                                   then hex !! (rem n 10)
                                   else show n
                       
convertFrom from number result power
    | number == "" = result
    | otherwise   = convertFrom from num (result + d * power) (power * from)
                    where l   = Prelude.last number
                          num = Prelude.init number
                          d   = C.digitToInt $ l
