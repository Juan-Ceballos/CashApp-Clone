# CashApp-TakeHome

## Architech

Considering the scope I took for the project, I decided on MVC architecture. I utilized programmatic UI to have wider control of each UI component and its placement.

## Tradeoffs

For simplicity I could have used one of the provided UITableView types, but I though organizing the layouts in a compositional collection view with a dataSource allowed for a balance of simplicity and customization specially if future additions are to be made. This does has it's limits specially if adding multiple sections and scrolling behaviours, in that case I would refactor to a compositional collection view but for scope of project did not want use such a powerful tool for a scroll down table with custom cells.

## Run

Should be able to clone/extract and run project as is.

## Third Party Libraries

For this project I did not use any third party libraries, I would normally utilize SnapKit, but decided against it since it is a one page app and did not have to bloat project.

## Other Notes

Normally in a project I am use to doing the network portion of app with a URLSession Singleton, and creating a Network Helper, then using escaping closures to handle fetch requests but wanted to leverage the convenience of Swift Concurrency that I have been attempting to use more in my newer projects.
For testing I was not sure whether to model a personal portfolio or a company's portfolio. to handle something wrong with the data being fetched I check the data count to make sure it is greater than the count that an error message might provide, then we have a test to see when a stock model is made but the count of stocks in model is 0 so I asserted the count is 0, finally if the user has at least a count of one meaning the portfolio is not empty I use a test to see if the model's stock array has at least 1 stock object. All test are asynchronouse and require an internet connection, if allowed to expand on project I might setup dummy data to test when network is down.
