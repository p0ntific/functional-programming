
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleContexts #-}

-- Класс типов с ассоциированным типом
class Convertible a where
    type Converted a
    convert :: a -> Converted a

-- Объявляем несколько типов
data Celsius = Celsius Double deriving Show
data Fahrenheit = Fahrenheit Double deriving Show
data Kelvin = Kelvin Double deriving Show

-- Реализация для преобразования Celsius в Fahrenheit
instance Convertible Celsius where
    type Converted Celsius = (Fahrenheit, Kelvin)
    convert (Celsius c) = (Fahrenheit (c * 9 / 5 + 32), Kelvin (c + 273.15))

-- Функция для демонстрации
main :: IO ()
main = do
    let tempC = Celsius 25
    let (tempF, tempK) = convert tempC
    putStrLn $ "Temperature in Celsius: " ++ show tempC
    putStrLn $ "Temperature in Fahrenheit: " ++ show tempF
    putStrLn $ "Temperature in Kelvin: " ++ show tempK
