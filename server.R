#define server logic to draw a histogram

shinyServer(function(input, output) {
  output$deathbar <- renderPlot({
    first <- overdoses_by_year %>% group_by(State) %>% filter(year == input$radio_year, Deaths > input$opioid_deaths) %>% select(State,Population,Deaths)
    ggplot(first) + aes(x=State, y=Deaths, fill=Population) + geom_bar(stat="identity") + coord_flip() + scale_fill_gradient(low = "blue", high = "red", name = "Population", labels = comma) + labs(title="Total Overdose-Related Deaths")
    
  })
  output$deathcapbar <- renderPlot({
    first <- overdoses_by_year %>% group_by(State) %>% filter(year == input$radio_year, Deaths > input$opioid_deaths) %>% select(State,Population,DeathsPerCapita100k)
    ggplot(first) + aes(x=State, y=DeathsPerCapita100k, fill=Population) + geom_bar(stat="identity") + coord_flip() + scale_fill_gradient(low = "blue", high = "red", name = "Population", labels = comma) + ylim(0,50) + labs(y="Deaths per 100k",title="Overdose-Related Deaths per 100,000 People")
    
  })
  
  output$singleState <- renderPlot({
    first <- overdoses_by_year %>% group_by(State) %>% filter(year == input$radio_year, State==input$select) %>% select(State,opioidPrescriptions,OpioidPrescriptionsPerPerson)
    ggplot(first) + aes(x=State, y=opioidPrescriptions) + geom_bar(stat="identity") + ylim(0, 200000) + labs(y="Opioid Prescriptions", title="Total Opioid Prescriptions")
   
  })
  
  output$singleStatePP <- renderPlot({
    first <- overdoses_by_year %>% group_by(State) %>% filter(year == input$radio_year, State==input$select) %>% select(State,opioidPrescriptions,OpioidPrescriptionsPerPerson)
    ggplot(first) + aes(x=State, y=OpioidPrescriptionsPerPerson*100) + geom_bar(stat="identity") + ylim(0, 350) + labs(y="Opioid Prescriptions per 100 People", title="Opioid Prescriptions Per 100 People")
    
  })  
  
  
})