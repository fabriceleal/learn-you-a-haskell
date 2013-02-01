import Data.Char

main = do
     putStrLn "1st name?"
     firstName <- getLine
     putStrLn "last name?"
     lastName <- getLine
     let bigFirstName = map toUpper firstName
         bigLastName = map toUpper lastName
     putStrLn $ "hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"
