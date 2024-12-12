
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}

-- Класс типов для преобразования из типа a в тип b
class Convertible a b | a -> b where
    convert :: a -> b

-- Объявляем несколько типов
data Celsius = Celsius Double deriving Show
data Fahrenheit = Fahrenheit Double deriving Show
data Kelvin = Kelvin Double deriving Show

-- Реализуем преобразование из Celsius в Fahrenheit
instance Convertible Celsius Fahrenheit where
    convert (Celsius c) = Fahrenheit (c * 9 / 5 + 32)

-- Реализуем преобразование из Celsius в Kelvin
instance Convertible Celsius Kelvin where
    convert (Celsius c) = Kelvin (c + 273.15)

-- Функция для демонстрации
main :: IO ()
main = do
    let tempC = Celsius 25
    let tempF = convert tempC :: Fahrenheit
    let tempK = convert tempC :: Kelvin
    putStrLn $ "Temperature in Celsius: " ++ show tempC
    putStrLn $ "Temperature in Fahrenheit: " ++ show tempF
    putStrLn $ "Temperature in Kelvin: " ++ show tempK
