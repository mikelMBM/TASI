function percent(per, of){
	return (of/100)*per;
};

function averageMannschaft(data, average){
	var dataMannschaft = [];
	for(i=0; i<data.length; i++){
		var obj = {	valX: data[i].valX,
					valY: average
		}
		dataMannschaft.push(obj);		
	}
	return dataMannschaft;
};

function labelF(MS){
	averageLabel = "";
	if(MS == "M"){
		averageLabel = "Mannschaftsdurchschnitt";
		return averageLabel;
	}else if(MS == "S"){
		averageLabel = "Durchschnitt";
		return averageLabel;
	};
};

function chart(data, average, pos, w, h, MS){

var translationX = 30;
var translationY = 40;

var translation = 70;

var max = d3.max(data, function(d) { return + d.valY;} );

var xScale = d3.scaleLinear()
				.domain([0, data.length])
				.range([translation, w]);
				
var yScale = d3.scaleLinear()
				.domain([0, max + percent(50, max)])
				.range([h, translation]);

var svg = d3.select(pos)
			.append("svg")
			.attr("width", w)
			.attr("height", h);
			
var container = svg.append("g")
			
var xAxis = d3.axisBottom(xScale)
			.tickFormat("")
			.tickSize(0);
			
var yAxis = d3.axisLeft(yScale)

var appendX = container.append("g")
			  .attr("transform", "translate("+ (-40) + "," + (h-40) + ")")
			  .classed("xaxis", true)
			  .call(xAxis);
			  
var appendY = container.append("g")
			  .attr("transform", "translate("+ translationX + "," + (-translationY) + ")")
			  .classed("yaxis", true)
			  .call(yAxis);

d3.selectAll(".domain")
			.attr("fill", "none")
			.attr("stroke", "#045FB4")
			.attr("stroke-width", 1);
			
var lineSpieler = d3.line()
				.x(function(d, i){
					return xScale(i)+translationX
				})
				.y(function(d){
					return (yScale(d.valY))-translationY
				});
				
var lineMannschaft = d3.line()
				.x(function(d, i){
					return xScale(i)+translationX
				})
				.y(function(d){
					return (yScale(d.valY))-translationY
				});			
			
var pathSpieler = container.append("path")
			.attr("d", lineSpieler(data))
			.attr("fill", "none")
			.attr("stroke", "#045FB4")
			.attr("stroke-width", 2);
			
var pathMannschaft = container.append("path")
			.attr("d", lineMannschaft(averageMannschaft(data, average)))
			.attr("fill", "none")
			.attr("stroke", "#FF0000")
			.attr("stroke-width", 2);
			
var labelAverage = container.append("text")
			.attr("transform", "translate(" + (w/2) + ", " + (yScale(average)-50) + ")")
			.attr("font-family", "sans-serif")
			.attr("font-size", "12px")
			.attr("fill", "#FF0000")
			.attr("text-anchor", "middle")
			.text(labelF(MS));
			
			
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
			
			
};





