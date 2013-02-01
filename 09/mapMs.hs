-- if we want to map an IO function 
-- through a list we might make:
--      map print [1, 2, 3] will make [print 1, print 2, print 3]
-- we need to make instead:
--      sequence (map print [1, 2, 3, 4, 5])
-- or better yet:

main = mapM print [1, 2, 3]