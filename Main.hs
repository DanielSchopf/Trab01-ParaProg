{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import Control.Monad.IO.Class (liftIO)
import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as TL
import Text.Read (readMaybe)

main :: IO ()
main = scotty 3000 $ do
  middleware logStdoutDev

  -- Rota de saudação
  get "/" $ do
    text "Olá, este é um servidor de calculadora!"
    
  -- Rota para somar dois números
  get "/soma/:x/:y" $ do
    xStr <- param "x"
    yStr <- param "y"

    -- Tentar converter os parâmetros em números
    let maybeX = readMaybe (TL.unpack xStr)
        maybeY = readMaybe (TL.unpack yStr)
        
    -- faz a verificação dos parametros pra validar ou a operação ou mostrar o texto de erro
    case (maybeX, maybeY) of
      (Just x, Just y) -> do
        let resultado = x + y
        text (TL.pack ("Valor da operação: " ++ show resultado))
      _ -> text "Erro: Certifique-se de que x e y são números válidos."
