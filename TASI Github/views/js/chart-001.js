function chart(data){

var w = 500;
var h = 400;
var translationX = 20;
var translationY = 40;

var translation = 50;

var max = d3.max(data, function(d) { return + d.valY;} );
						
var xScale = d3.scaleLinear()
				.domain([0, data.length])
				.range([translation, w]);
				
var yScale = d3.scaleLinear()
				.domain([0, max])
				.range([h, translation]);

var svg = d3.select("body")
			.append("svg")
			.attr("width", w)
			.attr("height", h);
			
var container = svg.append("g")
			
var xAxis = d3.axisBottom(xScale)			  
var yAxis = d3.axisLeft(yScale)

var appendX = container.append("g")
			  .attr("transform", "translate("+ (-40) + "," + (h-40) + ")")
			  .classed("xaxis", true)
			  .call(xAxis)
			  
var appendY = container.append("g")
			  .attr("transform", "translate("+ translationX + "," + (-translationY) + ")")
			  .classed("yaxis", true)
			  .call(yAxis);

d3.selectAll(".domain")
			.attr("fill", "none")
			.attr("stroke", "#045FB4")
			.attr("stroke-width", 1);
			
var line = d3.line()
				.x(function(d, i){
					return xScale(i)+translationX
				})
				.y(function(d){
					return (yScale(d.valY))-translationY
				});
			
var path = container.append("path")
			.attr("d", line(data))
			.attr("fill", "none")
			.attr("stroke", "#045FB4")
			.attr("stroke-width", 2);
			
var points = container.selectAll("points")
			.data(data)
			.enter()
			.append("g")
			.attr("transform", function(d, i){return "translate("+(xScale(i)+translationX)+","+ (yScale(d.valY)-translationY) +")"});
			
var circle = points.append("circle")
			.attr("r", 10)
			.style("fill", "#045FB4");

var label = points.append("text")
			.attr("transform", "translate(0, 5)")
			.attr("font-family", "sans-serif")
			.attr("font-size", "12px")
			.attr("fill", "#FFFFFF")
			.attr("text-anchor", "middle")
			.text(function(d){return d.valY});
			
var datum = points.append("text")
			.attr("transform", "translate(0, -15)")
			.attr("font-family", "sans-serif")
			.attr("font-size", "12px")
			.attr("fill", "#045FB4")
			.attr("text-anchor", "middle")
			.text(function(d){return d.Datum});
			
			
			
}





