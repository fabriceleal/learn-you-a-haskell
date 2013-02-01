main = do
     putStrLn "Name?"
     name <- getLine
     putStrLn $ "Hey, " ++ name ++ " you rock!"
