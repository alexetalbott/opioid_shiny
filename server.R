#define server logic to draw a histogram

shinyServer(function(input, output) {
  output$deathbar <- renderPlot({
    first <- overdoses_by_year %>% group_by(State) %>% filter(year == input$radio_year, Deaths > input$opioid_deaths) %>% select(State,Population,Deaths)
    ggplot(first) + aes(x=State, y=Deaths, fill=Population) + geom_bar(stat="identity") + coord_flip() + scale_fill_gradient(low = "blue", high = "red", name = "Population", labels = comma)
    
  })
  output$deathcapbar <- renderPlot({
    first <- overdoses_by_year %>% group_by(State) %>% filter(year == input$radio_year, Deaths > input$opioid_deaths) %>% select(State,Population,DeathsPerCapita100k)
    ggplot(first) + aes(x=State, y=DeathsPerCapita100k, fill=Population) + geom_bar(stat="identity") + coord_flip() + scale_fill_gradient(low = "blue", high = "red", name = "Population", labels = comma) + ylim(0,50)
    
  })
  
  
  
})