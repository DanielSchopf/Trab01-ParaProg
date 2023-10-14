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

  --Rota base
  get "/" $ do
    text "Bem-vindo ao Servidor de Calculadora!\n\nPara realizar uma operação, utilize as seguintes rotas:\n\n- Soma: /soma/valor1/valor2\n- Subtração: /sub/valor1/valor2\n- Multiplicação: /mult/valor1/valor2\n"
    
  --Rota de Soma
  get "/soma/:x/:y" $ do
    --Responsável por passar os valores de "x" e "y" como parâmetro para as variáveis
    xStr <- param "x"
    yStr <- param "y"

    --Responsável por fazer a conversão dos valores das variáveis "xStr" e "yStr". Inicialmente de text para string e depois de string para número
    let maybeX = readMaybe (TL.unpack xStr)
        maybeY = readMaybe (TL.unpack yStr)
        
    --Faz o teste para verificar se a conversão foi bem-sucedida ou não
    case (maybeX, maybeY) of
      (Just x, Just y) -> do
        --Caso seja, faz a operação dos valores e imprime na tela a mensagem com o resultado
        let resultado = x + y
        text (TL.pack ("Valor da operação: " ++ show resultado))
        --Caso não seja, passa para essa linha do codigo(definido pelo "coringa" _ e imprime a mensagem de erro para o usuário)
      _ -> text "Erro: Certifique-se de que x e y são números válidos."

  --Rota para multiplicação
  get "/mult/:x/:y" $ do
    xStr <- param "x"
    yStr <- param "y"
  
    let maybeX = readMaybe (TL.unpack xStr)
        maybeY = readMaybe (TL.unpack yStr)

    case (maybeX, maybeY) of
      (Just x, Just y) -> do
        let resultado = x * y
        text (TL.pack ("Valor da operação: " ++ show resultado))
      _ -> text "Erro: Certifique-se de que x e y são números válidos."
      
  --Rota para subtração
  get "/sub/:x/:y" $ do
    xStr <- param "x"
    yStr <- param "y"

  let maybeX = readMaybe (TL.unpack xStr)
      maybeY = readMaybe (TL.unpack yStr)
      
  case (maybeX, maybeY) of
    (Just x, Just y) -> do
      let resultado = x - y
      text (TL.pack ("Valor da operação: " ++ show resultado))
    _ -> text "Erro: Certifique-se de que x e y são números válidos."
    
