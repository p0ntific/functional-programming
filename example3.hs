
{-# LANGUAGE NoMonomorphismRestriction #-}

-- Без явного указания типа
value = length [1,2,3]

-- С явным указанием полиморфного типа
polyValue :: Num b => b
polyValue = fromIntegral $ length [1,2,3]

-- Функция для демонстрации
main :: IO ()
main = do
    print value
    print (polyValue :: Int)
    print (polyValue :: Float)
