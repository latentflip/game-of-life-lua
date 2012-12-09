An attempt at a game of life implementation in lua.

## To play the game of life:

```
brew install lua
git clone https://github.com/latentflip/game-of-life-lua.git
cd game-of-life-lua
lua gol_play.lua
```

## To develop it further

I've used [busted](http://olivinelabs.com/busted/) for specs:

```
brew install luarocks
luarocks install busted
busted gol_spec.lua
```

[@philip_roberts](http://twitter.com/philip_roberts)

phil@latentflip.com

---

```
                ()        ()      ()                          ()()                                  
    ()                  ()  ()                                                  ()                  
  ()          ()()()  ()()    ()                                            ()    ()                
  ()()()    ()        ()()    ()  ()                                                                
        ()  ()  ()    ()()()        ()()  ()                                ()      ()              
    ()  ()  ()()        ()()  ()        ()  ()                                ()                    
    ()  ()()                          ()      ()                  ()()()      ()  ()                
()  ()()              ()()()()  ()()  ()      ()      ()                    ()()    ()              
  ()()            ()                  ()            ()  ()                ()    ()  ()()            
    ()            ()                                  ()()                ()()()      ()            
    ()()()                  ()              ()                            ()()()  ()()()            
  ()      ()  ()        ()()      ()    ()                ()()              ()      ()              
  ()        ()()                  ()()  ()              ()      ()          ()  ()                  
    ()  ()    ()                    ()()              ()                    ()  ()()                
          ()()                                        ()    ()                    ()()()            
            ()                                        ()()()()                      ()()            
                    ()                                                                              
    ()()            ()                  ()()    ()()                                                
    ()  ()          ()                  ()()    ()()                                          ()    
        ()()                                                    ()()                      ()()      
    ()  ()                                                                              ()      ()  
    ()()                                          ()          ()      ()()              ()  ()()    
                                                  ()()()      ()()()()  ()()          ()()    ()    
                                                ()      ()              ()          ()()()          
                                                ()      ()()()()  ()    ()              ()          
()()          ()                                ()      ()()  ()  ()  ()                            
()()            ()                                          ()()    ()                    ()  ()()  
            ()  ()                    ()              ()()()()                                ()()  
          ()()  ()                  ()  ()              ()()                        ()()            
              ()                  ()                                              ()()      ()      
  ()()                            ()      ()                                  ()()      ()          
  ()  ()              ()()()      ()                                                ()()            
      ()()  ()        ()()                  ()                                ()  ()                
        ()()          ()()        ()        ()                                ()                    
        ()()        ()    ()    ()()  ()()()                  ()()            ()  ()()              
                      ()    ()    ()      ()                  ()()              ()    ()            
                    ()        ()()()()()()                                        ()()()            
    ()()      ()()()()        ()        ()                                                          
            ()()              ()()                                                                  
```
